;;; init-ruby.el --- configure Emacs Ruby mode

;; other files which are in ruby mode
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))

(defun get-rubbish-buffer-create (&optional name)
  "Setup Ruby scratch buffer in Ruby interactive mode"
  (unless name
    (setq name "*rubbish*"))
  (get-buffer-create name)
  (set-buffer name)
  (ruby-mode)
  (switch-to-buffer-other-window name))

(defun outline-ruby ()
  "Use `occur' to generate an outline of a Ruby file"
  (let ((matches '("module " "class " "def " "alias_method " "Object.new"
                   "private" "protected" "public")))
    (occur (mapconcat 'identity matches "\|"))))

(defun init-ruby-mode ()
  (setq comint-process-echoes t)
  (setq ruby-deep-indent-paren-style nil)
  (setq ruby-use-encoding-map nil)
  (setq ruby-insert-encoding-magic-comment nil)
  (define-key ruby-mode-map (kbd "RET")
    'reindent-then-newline-and-indent))

(add-hook 'ruby-mode-hook 'init-ruby-mode)

(provide 'init-ruby)
;;; init-ruby.el ends here
