;;; init-eshell.el --- configure Emacs Eshell

;;; http://www.masteringemacs.org/article/complete-guide-mastering-eshell


(add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "emacs")))

;;;###autoload
(defun eshell/clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(provide 'init-eshell)
;;; init-eshell.el ends here
