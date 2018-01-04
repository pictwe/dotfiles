

; Package Managment
(setq load-prefer-newer t)
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
			 ("MELPA Stable" . "https://stable.melpa.org/packages/")
			 ("MELPA" . "https://melpa.org/packages/"))
      package-archive-priorities '(("MELPA" . 10)
				   ("GNU ELPA" . 5)
				   ("MELPA Stable" . 0))
; Packages can be pinned to use a specific repository outside the priorities above:
;      package-pinned-packages '("ivy" . "MELPA")
      )

(package-initialize)

; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

; User Interface

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;(use-package powerline
;	     :ensure t)

(use-package moe-theme
	     :ensure t
	     :config
	     (load-theme 'moe-dark t)
;	     (powerline-moe-theme))
)

(use-package paradox
	     :ensure t)

; line numbers

(use-package nlinum
  :ensure t
  :bind (("C-c t l" . nlinum-mode)))

; mode line


(use-package anzu
	     :ensure t
	     :defer 1
	     :config
	     (global-anzu-mode))

(use-package spaceline-config           ; A beautiful mode line
  :ensure spaceline
  :config
  (spaceline-emacs-theme))

(use-package powerline                  ; The work-horse of Spaceline
  :ensure t
  :after spaceline-config)


; autosave

(use-package validate
	     :ensure t)
(validate-setq backup-directory-alist
	       `((".*" . "~/.emacs.d/backup"))
	       auto-save-file-name-transforms
	       `((".*" "~/.emacs.d/autosave" t)))

; TeX

(use-package tex-site
  :ensure auctex)
(setq-default TeX-engine 'luatex)

; Company mode

(use-package company
	     :ensure t
	     :defer 1
	     :config
	     (global-company-mode))

(use-package company-math
	     :ensure t
	     :after company
	     :config
	     (add-to-list 'company-backends 'company-math-symbols-unicode)
	     (add-to-list 'company-backends 'company-math-symbols-latex))

(use-package company-auctex
	     :ensure t
	     :after company
	     :config
	     (company-auctex-init))

;(load "auctex.el" nil t t)

 	
;(setq font-latex-fontify-sectioning 1.0)

;(setq font-latex-fontify-script nil)
;(setq font-latex-fontify-sectioning 'color)
;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-engine 'luatex)
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(package-selected-packages (quote (auctex powerline moe-theme neotree seoul256-theme))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-ghc company-ghci haskell-mode company-auctex validate use-package spaceline seoul256-theme paradox nlinum neotree moe-theme company-math auctex anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
