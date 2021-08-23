(import (scheme base) (scheme file) (scheme read) (scheme write)
        (srfi 1) (srfi 13) (srfi 132))

(import (only (chicken file) create-directory directory)
        (only (chicken process-context) change-directory)
        (only (sxml-transforms) SXML->HTML)
        (only (lowdown) markdown->sxml)
        (only (www-lowdown-colorize) enable-www-lowdown-colorize!))

(enable-www-lowdown-colorize!)

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

(define (page-title-from-sxml tags)
  (let rec ((tags tags))
    (cond ((not (pair? tags)) #f)
          ((eqv? 'h1 (car (car tags)))
           (apply string-append (cadr (car tags))))
          (else (rec (cdr tags))))))

(define (markdown-file->sxml md-filename)
  (call-with-port (open-input-file md-filename) markdown->sxml))

(define (write-simple-page html-filename md-filename description)
  (let ((sxml (markdown-file->sxml md-filename)))
    (write-html-file html-filename
                     (or (page-title-from-sxml sxml) "")
                     description
                     sxml)))

(define (main)
  (create-directory "www")
  (write-simple-page "www/index.html" "surveys/index.md"
                     "Scheme Surveys")
  (for-each (lambda (name)
              (let ((ext ".md"))
                (when (string-suffix? ext name)
                  (let ((stem (string-drop-right name (string-length ext))))
                    (unless (string=? stem "index")
                      (let* ((hdir (string-append "www/" stem))
                             (html (string-append hdir "/index.html")))
                        (create-directory hdir)
                        (write-simple-page
                         html
                         (string-append "surveys/" name)
                         "Scheme Surveys")))))))
            (list-sort string<? (directory "surveys")))
  0)

(main)
