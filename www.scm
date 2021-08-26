(import (scheme base) (scheme file) (scheme read) (scheme write)
        (srfi 1) (srfi 13) (srfi 132))

(import (only (chicken file) create-directory directory)
        (only (chicken process-context) change-directory)
        (only (colorize)
              coloring-type-exists? coloring-type-names html-colorize)
        (only (html-parser) html->sxml)
        (only (pandoc) pandoc-file->sxml)
        (only (sxml-transforms) SXML->HTML))

(define global-description
  "Surveys of Scheme implementation features.")

(define (disp . xs) (for-each display xs) (newline))

(define (write-html-file html-filename title description body)
  (disp "Writing " html-filename)
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

(define (map-sxml-elems update tag elems)
  (letrec ((convert-elem
            (lambda (elem)
              (if (and (pair? elem)
                       (symbol? (car elem))
                       (eq? tag (car elem)))
                  (update elem)
                  elem)))
           (convert-elems
            (lambda (elems)
              (if (not (pair? elems)) elems
                  (map convert-elem elems)))))
    (convert-elems elems)))

(define (dashes->spaces string)
  (string-map (lambda (c) (if (char=? c #\-) #\space c)) string))

(define (spaces->dashes string)
  (string-map (lambda (c) (if (char=? c #\space) #\- c)) string))

(define (coloring-type-string->symbol string)
  (let ((string (dashes->spaces string)))
    (let loop ((names (coloring-type-names)))
      (and (not (null? names))
           (if (string-ci= string (cdar names))
               (caar names)
               (loop (cdr names)))))))

(define (colorize-sxml elems)
  (map-sxml-elems
   (lambda (elem)
     (let* ((attrs (and (pair? (cadr elem))
                        (eq? '@ (car (cadr elem)))
                        (cdr (cadr elem))))
            (syn-attr (assq 'data-syntax attrs))
            (syn (and syn-attr (pair? (cdr syn-attr)) (cadr syn-attr)))
            (synsym (and syn (coloring-type-string->symbol syn)))
            (body (fold string-append "" ((if attrs cddr cdr) elem))))
       `(pre (code (@ (class "colorize") ,@(or attrs '()))
                   ,@(if (and syn (coloring-type-exists? synsym))
                         (cdr (html->sxml (html-colorize synsym body)))
                         (list body))))))
   'pre elems))

(define (page-title-from-sxml tags)
  (let rec ((tags tags))
    (cond ((not (pair? tags)) #f)
          ((eqv? 'h1 (car (car tags)))
           (apply string-append (cdr (car tags))))
          (else (rec (cdr tags))))))

(define (markdown-file->sxml md-filename)
  (pandoc-file->sxml 'gfm md-filename))

(define (survey-github-url stem)
  (string-append "https://github.com/schemedoc/surveys/blob/master/surveys/"
                 stem ".md"))

(define (survey-md-filename stem)
  (string-append "surveys/" stem ".md"))

(define (write-survey-page stem)
  (let* ((md-filename (survey-md-filename stem))
         (html-dir (string-append "www/" stem))
         (html-filename (string-append html-dir "/index.html")))
    (create-directory html-dir)
    (let ((sxml (markdown-file->sxml md-filename)))
      (write-html-file
       html-filename
       (let ((t (page-title-from-sxml sxml)))
         (if t (string-append t " (Scheme Surveys)")
             "Scheme Surveys"))
       global-description
       (append (colorize-sxml sxml)
               `((hr)
                 (p (a (@ (href "../"))
                       "Back to Scheme Surveys"))
                 (p (small
                     (a (@ (href ,(survey-github-url stem))
                           (rel "noreferrer"))
                        "Page source (GitHub)")))))))))

(define (list-surveys)
  (define (filename->survey name)
    (let ((ext ".md"))
      (when (string-suffix? ext name)
        (string-drop-right name (string-length ext)))))
  (list-sort string<? (filter-map filename->survey (directory "surveys"))))

(define (write-survey-pages)
  (for-each write-survey-page (list-surveys)))

(define (write-index-page)
  (let ((sxml (colorize-sxml (markdown-file->sxml "index.md"))))
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
                                      (title (page-title-from-sxml
                                              (markdown-file->sxml
                                               (survey-md-filename survey)))))
                                  `(li (a (@ (href ,href))
                                          ,title))))
                              group-surveys)))))
             groups))))))

(define (main)
  (create-directory "www")
  (write-index-page)
  (write-survey-pages)
  0)

(main)
