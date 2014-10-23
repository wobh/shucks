;; -*- mode: emacs-lisp; -*-
;;; init-windows-nt.el --- Settings for Emacs on windows-nt

(when (string-equal system-type "windows-nt")

  ;; Add to the end of the default info path list
  (setq Info-default-directory-list
        (append Info-default-directory-list
                '("C:\Program Files (x86)\GnuWin32\info")))
)

(provide 'init-windows-nt)
;;; init-windows-nt.el ends here
