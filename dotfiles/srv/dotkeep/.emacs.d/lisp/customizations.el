;;; Customizations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#343d46" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#dfe1e8"])
 '(ansi-term-color-vector
   [unspecified "#343d46" "#bf616a" "#a3be8c" "#ebcb8b" "#8fa1b3" "#b48ead" "#8fa1b3" "#dfe1e8"] t)
 '(custom-safe-themes
   (quote
    ("ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" default)))
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(enh-ruby-use-encoding-map nil)
 '(enh-ruby-use-ruby-mode-show-parens-config t)
 '(occur-linenumbers-in-margin 1)
 '(org-babel-load-languages
   (quote
    ((plantuml . t)
     (dot . t)
     (lisp . t)
     (ruby . t)
     (sh . t)
     (emacs-lisp . t)
     (python . t)
     (js . t)
     (calc . t)
     (sql . t)
     (lisp . t))))
 '(org-capture-templates
   (quote
    (("n" "Note" entry
      (file "~/Documents/org/notes.org")
      "" :empty-lines-before 1)
     ("m" "Meeting minutes" entry
      (file "~/Documents/org/meetings.org")
      "" :empty-lines-before 1 :clock-in t))))
 '(org-export-backends (quote (ascii html icalendar latex md odt org confluence))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-info ((t (:inherit success))))
 '(enh-ruby-heredoc-delimiter-face ((t (:foreground "#999999"))))
 '(enh-ruby-op-face ((t (:foreground "#999999"))))
 '(enh-ruby-regexp-delimiter-face ((t (:foreground "#999999"))))
 '(enh-ruby-string-delimiter-face ((t (:foreground "#999999"))))
 '(success ((t (:foreground "green" :weight normal)))))
