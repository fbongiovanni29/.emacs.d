(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)

(global-set-key (kbd "M-x") 'helm-M-x)

(projectile-global-mode)
(setq projectile-completion-system 'grizzl)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#303030")

(require 'general)
(general-evil-setup t)
(evilnc-default-hotkeys)

(require 'evil-numbers)

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
  "j" 'avy-goto-char
  "k" 'kill-buffer
  "r" 'helm-recentf
  "l" 'other-window
  "s" 'magit-status
  "|" 'split-window-right
  "-" 'split-window-below
)

(setq evil-default-cursor t)
(require 'evil)
;; enable evil-mode
(evil-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'evil-terminal-cursor-changer)

(setq evil-normal-state-cursor '("white" box));
(setq evil-visual-state-cursor '("blue" hbar));
(setq evil-insert-state-cursor '("green" bar));
(setq evil-emacs-state-cursor '("green" hbar));
