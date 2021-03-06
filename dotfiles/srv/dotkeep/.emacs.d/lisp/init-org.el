;;; init-org.el --- configure emacs org-mode

(setq org-directory "~/Documents/org")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; setup org-capture

(global-set-key "\C-cc" 'org-capture)
(setq org-default-notes-file
      (expand-file-name "notes.org"
			(file-name-as-directory org-directory)))


;; setup export

(setq org-export-dispatch-use-expert-ui t)
(setq org-export-backends '(ascii html icalendar latex md odt confluence))


;; setup hooks
(add-hook 'org-mode-hook '(lambda () (toggle-truncate-lines 1)))


;; setup plantuml jar path

(setq org-plantuml-jar-path
      (setq plantuml-jar-path (expand-file-name "~/bin/plantuml.jar")))


;; tangle code when TODO property is in done state

(defun tangle-done (file &optional dir)
  (unless dir
    (setq dir (or (file-name-directory file) ".")))
  (when (org-entry-is-done-p)
      (concat (file-name-as-directory dir) file)))

(defun noweb-done (ref)
  (when (org-entry-is-done-p)
    ref))

;; example

;; #+HEADER: :tangle (tangle-done ".editenv" "~")
;; #+BEGIN_SRC sh
;;   # -*- mode: sh; -*-
;;   # Setup emacs environment
;;
;;   export ALTERNATE_EDITOR=""
;;   export EDITOR="emacsclient -t"
;; #+END_SRC

;; #+HEADER: :noweb-ref (noweb-done "aliases-emacs")
;; #+BEGIN_SRC sh
;;   alias e="$EDITOR -a=''"
;; #+END_SRC

(provide 'init-org)
;;; init-org.el ends here
