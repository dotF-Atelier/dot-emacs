;;; shell.el --- integrate shell setup

;;; Commentary:
;;

;;; Code:

;; vterm
(use-package
  vterm
  :commands vterm
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
  :bind
  (:map evil-normal-state-map
	("<leader>ot" . 'vterm-toggle))
  (:map vterm-mode-map
	("C-u" . 'vterm-send-C-u)
	("C-h" . 'vterm-send-C-h)
	)
  :hook (vterm-mode . (lambda()
			(linum-mode -1))))

(provide 'k_shell)
;;; shell.el ends here
