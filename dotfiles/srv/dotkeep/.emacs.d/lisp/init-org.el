;;; init-org.el --- configure emacs org-mode

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(setq org-export-backends '(ascii html icalendar latex md odt))

(provide 'init-org)
;;; init-org.el ends here
