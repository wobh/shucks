;;; init-custom.el --- configure Emacs customizations

;;(require 'cus-edit+)

(setq custom-file 
      (concat
       (file-name-as-directory user-elisp-directory)
       "customizations.el"))

(defun init-custom-load ()
  (when (file-exists-p custom-file)
    (load custom-file)))

(provide 'init-custom)
;;; init-custom.el ends here
