(defpackage :defun/test-a
  (:use :cl :redefun/main)
  (:export :test1 :test2 :test3)
  (:shadowing-import-from :redefun/main :defun))
(in-package :defun/test-a)

(defun test1 () :a)
(defun test2 () :c)
(defun test3 () (list (test1) (test2)))

(test3) ;; => (:A :C)

(defpackage :defun/test-b
  (:use :cl :redefun/main :defun/test-a)
  (:shadowing-import-from :redefun/main :defun)
  (:shadow :test1)) ;; this is the important part. to keep same name function but in different package.
(in-package :defun/test-b)

(defun test1 () :b)
(test3) ;; => (:B :C)
