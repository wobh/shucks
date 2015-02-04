;;; init-ruby.el --- configure Emacs Ruby mode

(defun init-ruby-mode ()
  (setq comint-process-echoes t)
  (setq ruby-deep-indent-paren-style nil)
  (setq ruby-use-encoding-map nil)
  (setq ruby-insert-encoding-magic-comment nil)
  (smartparens-mode)
  (define-key ruby-mode-map (kbd "RET")
    'reindent-then-newline-and-indent))

(add-hook 'ruby-mode-hook 'init-ruby-mode)

;;; Enhanced Ruby

(defun init-enh-ruby-mode ()
  (smartparens-mode))

(add-hook 'enh-ruby-mode-hook 'init-enh-ruby-mode)

;; other files which are in ruby mode
(add-to-list 'auto-mode-alist '("[Rr]akefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("pryrc" . ruby-mode))
(add-to-list 'auto-mode-alist '("thor" . ruby-mode))

;; misc

(defun get-rubbish-buffer-create (&optional uarg name)
  "Setup Ruby scratch buffer in Ruby interactive mode"
  (interactive
   (let ((default-buffer-name "*rubbish*"))
     (setf name
           (if uarg
               (read-string "rubbish buffer name:"
                            nil default-buffer-name)
             default-buffer-name))))
  (get-buffer-create name)
  (set-buffer name)
  (ruby-mode)
  (inf-ruby-minor-mode)
  (switch-to-buffer-other-window name))

(defun outline-ruby ()
  "Use `occur' to generate an outline of a Ruby file"
  (interactive)
  (let ((matches '("module " "class " "def "
                   "alias_method " "Object.new"
                   "private" "protected" "public")))
    (occur (mapconcat 'identity matches "\\|"))))

(defun outline-rspec ()
  "Use `occur' to generate an outline of an RSpec file"
  (interactive)
  (let ((matches '("describe" "context" "it"
		   "before" "after"
		   "subject" "let")))
    (occur (mapconcat 'identity matches "\\|"))))


(provide 'init-ruby)
;;; init-ruby.el ends here
