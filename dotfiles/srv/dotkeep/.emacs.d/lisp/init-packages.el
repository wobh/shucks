;;; init-packages.el --- configure Emacs packages

(package-initialize)

(add-to-list 'package-archives 
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

(provide 'init-packages)
;;; init-packages.el ends here
