(atom 23.5)
(list 1 2 3)
(format t "Hello World!")
(print "Hello World!")
(let ((message "Lexically scoped"))
    (print message)
)

(defparameter *global* "Dynamically scoped")
(defvar *global2*)
(print *global*)

(defconstant PI 3.14159265358)

(defun circumference(red)
    "Print the circumference of a circle"
    (* 2 PI rad)
)

(mapcar #'circumference (list 5 10 20))

(loop for x from 0 to 68 by 3 do 
      (print x)
)

(defmacro while (condition &body body)
  `(loop while ,condition do (progn ,@body)))


