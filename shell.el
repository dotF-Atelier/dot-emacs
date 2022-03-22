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
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
               '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (display-buffer-reuse-window display-buffer-in-direction)
                 ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                 (direction . bottom)
                 (dedicated . t) ;dedicated is supported in emacs27
                 (reusable-frames . visible)
                 (window-height . 0.3)))
  (setq vterm-max-scrollback 10000)
  (define-key vterm-mode-map (kbd "C-u") 'vterm-send-C-u)
  (define-key vterm-mode-map (kbd "C-h") 'vterm-send-C-h)
  :hook (vterm-mode . (lambda()
			(linum-mode -1))))

(provide 'k_shell)
;;; shell.el ends here
