(import (scheme base) (scheme file) (scheme read) (scheme write)
        (srfi 1) (srfi 13) (srfi 132))

(import (only (chicken file) create-directory directory)
        (only (chicken process-context) change-directory))

(import (only (pandoc) pandoc-files->sxml)
        (only (pandoc tar) pandoc-tar)
        (only (colorize-sxml)
              colorize-sxml)
        (only (sxml-transforms)
              SXML->HTML))

(define global-description
  "Surveys of Scheme implementation features.")

(define (write-html-file html-filename title description body)
  (with-output-to-file html-filename
    (lambda ()
      (write-string "<!DOCTYPE html>")
      (SXML->HTML
       `(html (@ (lang "en"))
              (head
               (meta (@ charset "UTF-8"))
               (title ,title)
               (link (@ (rel "stylesheet") (href "/schemeorg.css")))
               (meta (@ (name "viewport")
                        (content "width=device-width, initial-scale=1")))
               (meta (@ (name "description")
                        (content ,description))))
              (body ,@body))))))

(define (page-title-from-sxml tags)
  (let rec ((tags tags))
    (cond ((not (pair? tags)) #f)
          ((eqv? 'h1 (car (car tags)))
           (apply string-append (cdr (car tags))))
          (else (rec (cdr tags))))))

(define (survey-github-url stem)
  (string-append "https://github.com/schemedoc/surveys/blob/master/surveys/"
                 stem ".md"))

(define (survey-md-filename stem)
  (string-append "surveys/" stem ".md"))

(define (list-surveys)
  (define (filename->survey name)
    (let ((ext ".md"))
      (and (string-suffix? ext name)
           (string-drop-right name (string-length ext)))))
  (list-sort string<? (filter-map filename->survey (directory "surveys"))))

(define (write-survey-page-using-sxml stem sxml)
  (let* ((html-dir (string-append "www/" stem))
         (html-filename (string-append html-dir "/index.html")))
    (create-directory html-dir)
    (write-html-file
     html-filename
     (let ((t-page (page-title-from-sxml sxml))
           (t-site "Scheme Surveys"))
       (if t-page (string-append t-page " (" t-site ")") t-site))
     global-description
     (append (colorize-sxml sxml)
             `((hr)
               (p (a (@ (href "../"))
                     "Back to Scheme Surveys"))
               (p (small
                   (a (@ (href ,(survey-github-url stem))
                         (rel "noreferrer"))
                      "Page source (GitHub)"))))))))

(define (write-index-page-using-sxml sxml surveys survey-sxmls)
  (let ((sxml (colorize-sxml sxml))
        (survey-titles (map (lambda (survey survey-sxml)
                              (cons survey
                                    (page-title-from-sxml survey-sxml)))
                            surveys
                            survey-sxmls)))
    (write-html-file
     "www/index.html"
     (page-title-from-sxml sxml)
     global-description
     (append
      sxml
      (let ((groups (with-input-from-file "www-index.scm" read)))
        (map (lambda (group)
               (let ((group-title (car group))
                     (group-surveys (cdr group)))
                 `(section
                   (h2 ,group-title)
                   (ul ,@(map (lambda (survey)
                                (let ((href (string-append survey "/"))
                                      (title (cdr (assoc survey
                                                         survey-titles))))
                                  `(li (a (@ (href ,href))
                                          ,title))))
                              group-surveys)))))
             groups))))))

(define (write-all-pages)
  (let* ((surveys (list-surveys))
         (all-md-files (cons "index.md" (map survey-md-filename surveys)))
         (all-sxmls (pandoc-files->sxml (pandoc-tar) 'gfm all-md-files))
         (index-sxml (car all-sxmls))
         (survey-sxmls (cdr all-sxmls)))
    (write-index-page-using-sxml index-sxml surveys survey-sxmls)
    (for-each write-survey-page-using-sxml surveys survey-sxmls)))

(define (main)
  (create-directory "www")
  (write-all-pages)
  0)

(main)
