;;; Project UID 2d6261568f83a98aa474c0a2b04179ce000b9a48

(let* ((yin
        ((lambda (cc) (display "@") cc)
         (call-with-current-continuation (lambda (c) c)))
       )
       (yang
        ((lambda (cc) (display "*") cc)
         (call-with-current-continuation (lambda (c) c)))
       )
      )
  (yin yang)
)
