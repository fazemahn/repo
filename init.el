;; List the packages you want
(setq package-list
      '(wrap-region modus-themes yasnippet
		    ivy swiper nov lsp-mode company))
;; Package Manager Setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Activate All Packages
(package-initialize)
;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;; Font and UI tweaks
(setq inhibit-startup-screen t)
(set-face-attribute 'default nil :height 130)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(load-theme 'modus-vivendi t)
;; For Purposes of Textbook Editing Work
(defun my/insert-latex ()
  (interactive)
  (insert "latex "))
;;; Wraps text around borders
(visual-line-mode t)
;;; Sets a useful keyboard shortcut. 
(global-set-key (kbd "<f1>") #'my/insert-latex)
;;; Configure the wrappers to enclose selected text.
(wrap-region-global-mode t)
(wrap-region-add-wrapper "$latex " "$" "$")
(wrap-region-add-wrapper "\\[" "\\]" "#")
(wrap-region-add-wrapper "\\text{" "}" "t")
(wrap-region-add-wrapper "<li>" "</li>" "i")
(wrap-region-add-wrapper "<td>" "</td>" "d")
(wrap-region-add-wrapper "<strong>" "</strong>" "b")
(wrap-region-add-wrapper "<tr>" "</tr>" "r")
;;Yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;;Ivy and Swiper
(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company lsp-mode nov swiper ivy yasnippet modus-themes wrap-region)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
