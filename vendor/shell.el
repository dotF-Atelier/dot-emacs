;;; shell.el --- integrate shell setup

;;; Commentary:
;;

;;; Code:

;; vterm
(use-package
  vterm
  :after evil-leader
  :commands vterm
  :init (evil-leader/set-key "ot" 'vterm-toggle)
  :config (setq vterm-max-scrollback 10000)
  (define-key vterm-mode-map (kbd "C-u") 'vterm-send-C-u)
  (define-key vterm-mode-map (kbd "C-h") 'vterm-send-C-h)
  :hook (vterm-mode . (lambda()
			(linum-mode -1))))

(provide 'k_shell)
;;; shell.el ends here
