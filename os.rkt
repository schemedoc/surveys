#! /usr/bin/env racket

#lang racket

;; raco pkg install css-expr txexpr
(require css-expr)
(require txexpr)

(define (xexpr->file html-filename xexpr)
  (call-with-atomic-output-file
   html-filename
   (λ (out . _) (displayln (xexpr->html xexpr) out))))

(define data (with-input-from-file "os.scm" read))

(define (feature-tds all-available-features-in-order features)
  (for-each (λ (feature)
              (unless (memq feature all-available-features-in-order)
                (error "missing from list of all features:" feature)))
            features)
  (map (λ (feature)
         (let ((has? (memq feature features)))
           `(td ((class ,(if has? "feature yes" "feature no"))))))
       all-available-features-in-order))

(define (feature-sections feature)
  (match feature
    [(cons feature-class feature-instances)
     (match feature-instances
       [(cons (cons 'features all-available-features-in-order) instances)
        `(section
          (h2 ,(symbol->string feature-class))
          (table
           (tr (th "Scheme")
               (th "Procedure")
               ,@(map (λ (feature) `(th ,(symbol->string feature)))
                      all-available-features-in-order))
           ,@(map (λ (instance)
                    (match instance
                      [(list 'implementation
                             scheme-impl impl-name impl-features)
                       `(tr
                         (td ,(symbol->string scheme-impl))
                         (td ,(symbol->string impl-name))
                         ,@(feature-tds all-available-features-in-order
                                        impl-features))]))
                  instances)))])]))

(xexpr->file
 "os.html"
 `(html
   (head
    (title "Scheme")
    (style ,(css-expr->css
             (css-expr
              [html #:background-color white #:font-family sans-serif]
              [table #:border-collapse collapse]
              [table td th #:border [1px solid black]]
              [td.feature #:text-align center]
              [td.feature.yes #:background-color lightgreen]
              [td.feature.yes::after #:content "\u2714"]
              [td.feature.no #:background-color lightyellow]
              [td.feature.no::after #:content "\u2715"]))))
   (body
    (h1 "Scheme")
    ,@(map feature-sections data))))
