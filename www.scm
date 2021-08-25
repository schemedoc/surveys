(import (scheme base) (scheme file) (scheme read) (scheme write)
        (srfi 1) (srfi 13) (srfi 132))

(import (only (chicken file) create-directory directory)
        (only (chicken process-context) change-directory)
        (only (colorize)
              coloring-type-exists? coloring-type-names html-colorize)
        (only (html-parser) html->sxml)
        (only (pandoc) pandoc-file->sxml)
        (only (sxml-transforms) SXML->HTML))

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

(define (write-simple-page html-filename md-filename description)
  (let ((sxml (markdown-file->sxml md-filename)))
    (write-html-file html-filename
                     (or (page-title-from-sxml sxml) "")
                     description
                     (colorize-sxml sxml))))

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
