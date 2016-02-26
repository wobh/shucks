;;; init-ruby.el --- configure Emacs Ruby mode

(defun init-ruby-mode ()
  (setq comint-process-echoes t)
  ;; (setq ruby-use-smie t)
  (setq ruby-deep-indent-paren-style nil)
  (setq ruby-use-encoding-map nil)
  (setq ruby-insert-encoding-magic-comment nil)
  (smartparens-mode)
  ;; TODO: deprecate? https://www.masteringemacs.org/article/whats-new-emacs-24-3#ruby-mode
  (define-key ruby-mode-map (kbd "RET")
    'reindent-then-newline-and-indent)
  )

(add-hook 'ruby-mode-hook 'init-ruby-mode)

;; NOPE: try
;;(add-hook 'ruby-mode-hook 'electric-indent-mode)

;;; Enhanced Ruby

(defun init-enh-ruby-mode ()
  (smartparens-mode)
  (setq enh-ruby-bounce-deep-indent t)
  ;; (setq enh-ruby-use-encoding-map nil)
  ;; (setq enh-ruby-use-ruby-mode-show-parens-config t)
  )

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

(defun get-rubbish-buffer-create ()
  "Setup Ruby scratch buffer in Ruby interactive mode"
  (interactive )
  (let ((name "*rubbish*"))
    (get-buffer-create name)
    (set-buffer name)
    (ruby-mode)
    (inf-ruby-minor-mode)
    (switch-to-buffer-other-window name)))

(defvar init-ruby-outline-matches
  '("module " "class " "def "
    "alias_method " "Object.new"
    "private" "protected" "public"
    "attr_accessor" "attr_writer" "attr_reader"))

;; TODO: find list of standard/common railsisms
(defvar init-ruby-outline-matches-rails
  (append init-ruby-outline-matches
	  '("attr_accessible" "attr_writable" "attr_readable")))

(defvar init-ruby-outline-matches-rspec
  (append init-ruby-outline-matches
	  '("describe" "context" "it"
	    "before" "after"
	    "subject" "let")))

(defvar init-ruby-outline-matches-rake
  (append init-ruby-outline-matches
	  '("namespace" "desc" "task" "def" "module" "class" "Rake" "Task")))

(defvar init-ruby-outline-matches-factory-girl
  (append init-ruby-outline-matches
	  '("factory" "define" "trait" "transient"
	    "sequence" "initialize_with")))

(defmacro defoutline (symbol name matches)
  "Define outliner function"
  `(defun ,(make-symbol (format "outline-%s" symbol)) ()
       ,(format "Use `occur' to generate an outline of a Ruby file" name)
     (interactive)
     (occur (mapconcat 'identity ,matches "\\|"))))

(pp (macroexpand '(defoutline ruby "Ruby" init-ruby-outline-matches)))
(defalias 'outline-ruby
  #'(lambda nil "Use `occur' to generate an outline of a Ruby file"
      (interactive)
      (occur
       (mapconcat 'identity init-ruby-outline-matches "\\|"))))
"(defalias 'outline-ruby
  #'(lambda nil \"Use `occur' to generate an outline of a Ruby file\"
      (interactive)
      (occur
       (mapconcat 'identity init-ruby-outline-matches \"\\\\|\"))))
"




(defoutline rake "Rake" init-ruby-outline-matches-rake)
(defoutline rspec "RSpec" init-ruby-outline-matches-rspec)
(defoutline rails "Rails" init-ruby-outline-matches-rails)
(defoutline factory-girl "Factory Girl" init-ruby-outline-matches-factory-girl)

;; ruby-dev

(add-to-list 'load-path "~/.emacs.d/misc/ruby-dev.el")
(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)

;; pry-remote

(defun inf-remote-pry (&rest args)
  (interactive)
  (let ((buffer (apply 'make-comint "pry-remote" "pry-remote" nil args)))
    (switch-to-buffer buffer)
        (setq-local comint-process-echoes t)))

(provide 'init-ruby)
;;; init-ruby.el ends here
