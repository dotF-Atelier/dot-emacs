;;; +text.el -*- lexical-binding: t; -*-


; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/note/"
      org-preview-latex-default-process 'dvisvgm)


;; Set up org-mode export stuff
(after! org
  ;; latex fomular scale
  (setq org-latex-pdf-process
        '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))


  ;; Set up org-ref stuff
  ;; (use-package! org-ref
  ;;   :custom
  ;;   (bibtex-completion-bibliography '("~/note/library.bib"))
  ;;   (reftex-default-bibliography '("~/note/library.bib"))
  ;;   (bibtex-completion-pdf-field "file")
  ;;   ;; (org-ref-default-bibliography "~/workspace/notes/library.bib")
  ;;   (defun my/org-ref-open-pdf-at-point ()
  ;;     "Open the pdf for bibtex key under point if it exists."
  ;;     (interactive)
  ;;     (let* ((results (org-ref-get-bibtex-key-and-file))
  ;;            (key (car results))
  ;;            (pdf-file (funcall org-ref-get-pdf-filename-function key)))
  ;;       (if (file-exists-p pdf-file)
  ;;           (find-file pdf-file)
  ;;         (message "No PDF found for %s" key))))
  ;;   (setq org-ref-completion-library 'org-ref-ivy-cite
  ;;         org-export-latex-format-toc-function 'org-export-latex-no-toc
  ;;         org-ref-get-pdf-filename-function
  ;;         (lambda (key) (car (bibtex-completion-find-pdf key)))
  ;;         ;; See the function I defined above.
  ;;         org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point
  ;;         ;; For pdf export engines.
  ;;         org-latex-pdf-process (list "latexmk -pdflatex='%latex -shell-escape -interaction nonstopmode' -pdf -bibtex -f -output-directory=%o %f")
  ;;         ;; I use orb to link org-ref, helm-bibtex and org-noter together (see below for more on org-noter and orb).
  ;;         org-ref-notes-function 'orb-edit-notes)
  ;;   )
  )

;; noter
(after! org-noter
  (setq
   org-noter-notes-search-path '("~/note/noter")
   org-noter-hide-other nil
   org-noter-separate-notes-from-heading t
   org-noter-always-create-frame nil)
  (map!
   :map org-noter-doc-mode-map
   :leader
   :desc "Insert note"
   "m i" #'org-noter-insert-note
   :desc "Insert precise note"
   "m p" #'org-noter-insert-precise-note
   :desc "Go to previous note"
   "m k" #'org-noter-sync-prev-note
   :desc "Go to next note"
   "m j" #'org-noter-sync-next-note
   :desc "Create skeleton"
   "m s" #'org-noter-create-skeleton
   :desc "Kill session"
   "m q" #'org-noter-kill-session
   )
  )

;; helm-bibtex related stuff
(after! helm
  (use-package! helm-bibtex
    :custom
    (bibtex-completion-bibliography '("~/note/library.bib"))
    (reftex-default-bibliography '("~/note/library.bib"))
    (bibtex-completion-pdf-field "file")
    :hook (Tex . (lambda () (define-key Tex-mode-map "\C-ch" 'helm-bibtex))))
  (map! :leader
        :desc "Open literature database"
        "o l" #'helm-bibtex)
  (map! :map helm-map
        "C-j" #'helm-next-line
        "C-k" #'helm-previous-line)
  )

;; This is to use pdf-tools instead of doc-viewer
(use-package! pdf-tools
  :config
  (pdf-tools-install)
  ;; This means that pdfs are fitted to width by default when you open them
  (setq-default pdf-view-display-size 'fit-width
                pdf-view-auto-slice-minor-mode t
                )
  :custom
  (pdf-annot-activate-created-annotations t "automatically annotate highlights")
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t)

  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

  )
