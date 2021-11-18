(line-number-mode 1)
(column-number-mode 1)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(setq ring-bell-function 'ignore)

(setq scroll-conservatively 100)

(setq display-time-24hr-format t)
(display-time-mode 1)

(global-subword-mode 1)

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))
(global-set-key (kbd "C-c w l") 'copy-whole-line)

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    ))

(electric-pair-mode t)

(global-hl-line-mode 1)

(global-prettify-symbols-mode t)

(setq org-src-window-setup 'current-window)
(add-to-list 'org-structure-template-alist
	     '("el" . "src emacs-lisp\n"))

(visual-line-mode t)
(global-visual-line-mode t)
(setq-default word-wrap t)

(org-babel-do-load-languages

   'org-babel-load-languages

   '((python . t)))

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

(setq ido-inable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'kill-all-buffers)

(defun kill-curr-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-curr-buffer)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit ()
  (interactive)
  (find-file "C:/Users/kelia/AppData/Roaming/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "C:/Users/kelia/AppData/Roaming/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") ' split-and-follow-horizontally) 


(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") ' split-and-follow-vertically)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(defalias 'yes-or-no-p 'y-or-n-p)
