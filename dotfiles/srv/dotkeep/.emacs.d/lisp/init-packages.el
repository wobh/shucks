;;; init-packages.el --- configure Emacs packages

(add-to-list 'package-archives 
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(provide 'init-packages)
;;; init-packages.el ends here
