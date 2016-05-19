(add-to-list 'load-path "~/.emacs.d/site-lib")

;; cursor is alway black because of evil
;; here is the workaround


(require 'general)
(general-evil-setup t)
