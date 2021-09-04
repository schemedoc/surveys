;; TODO: This should be integrated into the "colorize" Chicken egg.

(module colorize-sxml

  (colorize-sxml)

  (import (scheme))
  (import (chicken base))

  (import (only (srfi 1) fold))
  (import (only (srfi 13) string-ci= string-map))
  (import (only (html-parser) html->sxml))
  (import (only (colorize)
                coloring-type-exists?
                coloring-type-names
                html-colorize))

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
     'pre elems)))
