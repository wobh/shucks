;; -*- mode: emacs-lisp; no-byte-compile: t; -*-  
;;; ~/.emacs.d/init.el --- configure Emacs

;; Copyright (C) 2012, 2013, 2014 William Clifford

;; Author: William Clifford
;; Version: 0.2.0

;;; Commentary

;; A more complete description of this file and the configuration
;; packages it uses will be available as part of `dotfiles.org' coming
;; soon to a git repo near you.

;;; Code

;; Define folder for user elisp libraries

(defvar user-elisp-directory
  (expand-file-name 
   (concat 
    (file-name-as-directory user-emacs-directory)
    (file-name-as-directory "lisp")))
  "Directory of user elisp libraries")

(add-to-list 'load-path user-elisp-directory)


;; general requirements
(require 'autoload)
(require 'package)
;; (require 'cl)


;; setup first
(require 'init-packages)
(require 'init-custom)
;; (require 'init-system)
;; (require 'init-features)


;; setup rest
(require 'init-display)
(require 'init-lisp)
(require 'init-elisp)
(require 'init-eshell)
(require 'init-ruby)
(require 'init-text)


;; setup last
(init-custom-load)

;;; ~/.emacs.d/init.el ends here
