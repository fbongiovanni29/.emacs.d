(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                        ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)

(global-auto-complete-mode)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-flycheck-mode)

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#303030")

(require 'general)
(general-evil-setup t)
(evilnc-default-hotkeys)

(require 'evil-numbers)

(linum-relative-mode)

(require 'vertigo)

(nvmap :prefix "SPC"
  "SPC" 'helm-M-x
  "<up>" 'shrink-window
  "<down>" 'enlarge-window
  "<right>" 'enlarge-window-horizontally
  "<left>" 'shrink-window-horizontally
  "b" 'switch-to-buffer
  "cc" 'evilnc-comment-or-uncomment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "f" 'projectile-find-file
  "g" 'magit-dispatch-popup
  "h" 'avy-goto-char
  "n" 'neotree-toggle
  "j" 'vertigo-visual-jump-up
  "k" 'vertigo-visual-jump-down
  "r" 'helm-recentf
  "s" 'magit-status
  "t" 'linum-relative-toggle
  "|" 'split-window-right
  "-" 'split-window-below
)

(require 'which-key)
(which-key-mode)

(setq evil-default-cursor t)
(require 'evil)
;; enable evil-mode
(evil-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(rainbow-delimiters-mode)

(electric-pair-mode)

(vimish-fold-global-mode 1)
(evil-vimish-fold-mode 1)

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
    (quote
     ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "fbcdb6b7890d0ec1708fa21ab08eb0cc16a8b7611bb6517b722eba3891dfc9dd" "2a5be663818e1e23fd2175cc8dac8a2015dcde6b2e07536712451b14658bbf68" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(evil-shift-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-error :foreground "#b0171f" :weight normal))))
 '(flycheck-error ((t (:inherit error :underline (:color "blue" :style wave)))))
 '(flycheck-error-list-error ((t (:inherit (default default)))))
 '(flycheck-error-list-warning ((t (:foreground "color-52")))))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
	ad-do-it)
        ad-do-it))

(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."

  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (equal web-mode-content-type "jsx")
	      ;; enable flycheck
	      (flycheck-select-checker 'jsxhint-checker)
	                    (flycheck-mode))))


(define-key evil-normal-state-map (kbd "TAB") 'avy-goto-char)

(ido-mode 1)
(setq ido-separator "\n")

(add-to-list 'load-path "~/.emacs.d/lisp")
(require '.editorconfig)
(editorconfig-mode 1)
