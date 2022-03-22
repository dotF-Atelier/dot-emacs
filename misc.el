;;; misc.el --- misc file

;;; Commentary:
;;

;; config file shortcuts
(defun edcfg-init ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))
(defun edcfg-basic ()
  "Open the basic file."
  (interactive)
  (find-file (expand-file-name "basic.el" user-init-dir)))
(defun edcfg-vendor ()
  "Open the vendor setup file"
  (interactive)
  (cd (expand-file-name "vendor" user-init-dir))
  (call-interactively 'find-file)
  )
(evil-leader/set-key "ei" 'edcfg-init)
(evil-leader/set-key "eb" 'edcfg-basic)
(evil-leader/set-key "ev" 'edcfg-vendor)

;;; Build system
(defun my-compile-command-bearmake ()
  "Bear make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "bear make " (if buffer-file-name (shell-quote-argument (file-name-sans-extension
									buffer-file-name)))))
  (call-interactively 'compile))
(defun my-compile-command-make ()
  "Make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "make " (if buffer-file-name (shell-quote-argument (file-name-sans-extension
								   buffer-file-name)))))
  (call-interactively 'compile))

;; Premake
(defun my-compile-command-premake ()
  "Premake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "premake4 gmake " (if buffer-file-name (shell-quote-argument
						       (file-name-sans-extension
							buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-premake ()
  "Premake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cd build && bear make " (if buffer-file-name (shell-quote-argument
							      (file-name-sans-extension
							       buffer-file-name)))))
  (call-interactively 'compile))

;; CMake
(defun my-compile-command-cmake ()
  "CMake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=1 " (if buffer-file-name
									  (shell-quote-argument
									   (file-name-sans-extension
									    buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-cmake ()
  "CMake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake --build build " (if buffer-file-name (shell-quote-argument
							    (file-name-sans-extension
							     buffer-file-name)))))
  (call-interactively 'compile))


(provide 'misc)

;;; misc.el ends here
