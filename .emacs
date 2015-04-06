
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(custom-safe-themes (quote ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/org/English.org" "~/Dropbox/org/Journal.org" "~/Dropbox/org/Todo.org" "~/Dropbox/org/inbox.org")))
 '(org-startup-indented t)
 '(tool-bar-mode nil))

;; color scheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom-theme-directory/")
(load-theme 'gruvbox t)

;; package manager 
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))


;; setting for org
; turn on org-indented-mode and visual-line-mode 
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(setq-default cursor-type 'box)
(global-set-key "\C-ca" 'org-agenda)
;;set up capture
(setq org-directory "~/Dropbox/Org") 
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates 
     '(("t" "Todo" entry (file+headline (concat org-directory "/Todo.org") "Tasks")
	"* TODO %?\nEntered on %U\n  %i\n %a") 
       ("j" "Journal" entry (file+datetree (concat org-directory "/Journal.org"))
	 "* %?\nEntered on %U\n %\i\n")
       ("e" "English" entry (file+headline (concat org-directory "/English.org") "English")
	"* %?\nEntered on %U\n %i\n")))

;; Set to the name of the file where new notes will be stored
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/inbox.org")
(setq org-mobile-files '("~/Dropbox/org"))

;(load-file "~/.emacs.d/elpa/org-20140630/org-mobile.elc")
;(add-hook 'after-init-hook 'org-mobile-pull)
;(add-hook 'kill-emacs-hook 'org-mobile-push) 

(org-babel-do-load-languages 'org-babel-load-languages '((python . t)))
(setq org-src-fontify-natively t)

(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'install)

(require 'move-lines)
(move-lines-binding)
;(require 'tablature-mode.el)

; show parenthesis indication
(show-paren-mode 1)

; flyspell
(setq ispell-program-name "aspell")
(setq ispell-dictionary "en_GB")
(add-to-list 'exec-path "/usr/local/bin")

;(add-hook 'org-mode-hook (lambda () (flyspell-mode 1) ))
;(add-hook 'org-mode-hook
;	  '(lambda()
;	     (org-defkey org-mode-map "\C-c[" 'undefined)
;	     (org-defkey org-mode-map "\C-c]" 'undefined)
;	     (org-defkey org-mode-map "\C-c;" 'undefined)
;	     (org-defkey org-mode-map "\C-c\C-x\C-q" 'undefined))
;	  'append)

;(add-hook 'org-mode-hook
;	  '(lambda()
;	     (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
;	  'append)
;(defun bh/mail-subtree()
;  (interactive)
;  (org-mark-subtree)
;  (org-mime-subtree))

	
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Monaco")))))

	(add-hook 'python-mode-hook 'jedi:setup)
	(setq jedi:complete-on-dot t)                 ; optional
	(setq jedi:server-command '("~/.emacs.d/elpa/jedi-20140321.1323/jediepcserver.py"))
	(eval-after-load "python"
	'(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
	(add-hook 'jedi-mode-hook 'jedi-direx:setup)


	


(package-initialize)
;; turn on smart mode line
(sml/setup)

;; add directory into cache
(file-cache-add-directory "~/Dropbox/Training/Note/")

;; turn on line number for every buffer 
(global-linum-mode 1)

;; turn on winner mode which will remember windows/buffer setting
(winner-mode)

;; window move default key bind
(windmove-default-keybindings)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; turn off alarm bell in isearch and C-g
(setq ring-bell-function 
      (lambda ()
	(unless (memq this-command
		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))

;; add new line when at the buttom and hit C-n
(setq next-line-add-newlines t)

;; enable Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;; enbble search recent files
(require 'recentf)
;get rid of 'find-file-read-only' and replace it with something more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(recentf-mode t)  ; enable recent files mode.
(setq recentf-max-saved-items 50)  ; 50 files ought to be enough.
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; enable .bashrc setting in shell command invoked by M-!
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
(put 'set-goal-column 'disabled nil)

;; disable alert when turn on goal-column
;(put 'set-goal-column 'disabled nil)

;; enable Octave mode for .m file
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))


