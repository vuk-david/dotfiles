;; Default size upon opening Emacs(i.e. centered)
(setq initial-frame-alist
      '((top . 200) (left . 350) (width . 85) (height . 30)))

;; Disable Welcome-startup-screen
(setq inhibit-startup-screen t)

;; Disable these
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set font
(set-frame-font "Iosevka Comfy 10" nil t)

;; ;; Print all Family-fonts line-by-line:
;; (with-current-buffer (get-buffer-create "*Font List*")
;;   (erase-buffer)
;;   (dolist (font (font-family-list))
;;     (insert font "\n"))
;;  (switch-to-buffer (current-buffer)))

;; Theme
(load-theme 'dracula t)

;; Stop blinking of cursor
(blink-cursor-mode 0)

; Turn off the ring bell
(setq ring-bell-function 'ignore)


;; Elpa and Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)


;; Nemam pojma sta je ovo
;; Refresh package contents if not already done
(unless package-archive-contents
  (package-refresh-contents)) ;; M-x package-refresh-contents


;; ******************
;; *** MINIBUFFER ***
;; ******************

;; Horizontal options
(vertico-mode 1)

;; Details
(marginalia-mode 1)


;; Delete the previous path when inserting new ~/A/B/C~/. ==> ~/.
(file-name-shadow-mode 1)
(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)


;; *************
;; *** DIRED ***
;; *************

(setq dired-listing-switches "-AlX --group-directories-first")

;; Hide drwxrwxrwx...
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; Prevent pernament deletion
(setq delete-by-moving-to-trash t)
(setq dired-dwim-target t)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; Color background
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(org-block ((t (:background "#1c1f26")))))

;; (custom-set-faces
;; '(org-quote ((t (:background "#1c1f26" :foreground "#f8f8f2" :slant italic)))))
(setq org-fontify-quote-and-verse-blocks t)

(custom-set-faces
 '(org-block ((t (:background "#1c1f26"))))
 '(org-quote ((t (:background "#1c1f26" :foreground "#ffa500" :slant italic)))))

;; '(org-meta-line ((t (:background "#808080" :foreground "#000000"))))

;; (set-face-attribute 'org-block nil :background "#1e1f29")
;; (set-face-attribute 'org-quote nil :background "#21222c" :foreground "#f8f8f2" :slant 'italic)


;; (set-face-attribute 'org-latex-and-related nil :background "#21222c" :foreground "#f8f8f2")


;; Ne znam sta je, a ni da li radi
(setq org-src-tab-acts-natively t)

;; Change the display of Date-and-Time
(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%Y-%b-%d>" . "<%d. %b %Y. %H:%M>"))

		    




;; (setq user-emacs-directory "C:/Users/cevu/Desktop/Alat/Anti_Filozof/Emacs")

;; =====================================================================
;; =======================  Measure Startup Time =======================
;; =====================================================================

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; ===================================================================
;; =========================== FUNCTIONALITY =========================
;; ===================================================================

;; Prevents the screen to move up by half the screen when I'm down
(setq scroll-conservatively 101
      scroll-margin 0
      scroll-step 1)

;; When "autofill" is on, hard-wrap at 79 characters
(setq-default fill-column 79)


;; =================================================================
;; ============================ ORG-MODE ===========================
;; =================================================================

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c e m") (lambda () (interactive) (insert "—"))))



(add-hook 'org-mode-hook (lambda () (require 'ox-odt)))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (auto-fill-mode 1)
;;             (display-fill-column-indicator-mode 1)))


(defun my-org-mode-setup ()
  "Custom setup for Org mode."
  (auto-fill-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'org-mode-hook 'my-org-mode-setup)

;; Disable confirmation prompt for evaluating code
(setq org-confirm-babel-evaluate nil)

;; Enable Emacs Lisp
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)))

(setq org-emphasis-multiline t)



;; Hide special character that are needed for: *bold*, /italic/, etc.
;; (setq org-hide-emphasis-markers t)
(setq org-hide-emphasis-markers nil)

;; Don't create backup files
(setq make-backup-files nil)

;; (use-package darkroom
;;   :ensure t
;;   :custom
;;   (darkroom-text-scale-increase 0))

;; (use-package org-bullets
;;   :ensure t
;;   after org)



;; Ugraaadjdivanje slika u .org fajl direktno iz path-a
(defun encode-images-on-save ()
  "Automatically replace image references with Base64 data URLs in the current Org buffer."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\[\\[\\(file:\\|\\.\\)/\\([^\]]+\\)\\]\\]" nil t)
      (let* ((image-path (match-string 2))
             (full-path (expand-file-name image-path))
             (base64-img (format "<img src=\"data:image/png;base64,%s\">"
                                 (tob64 full-path))))
        (replace-match base64-img t t)))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'encode-images-on-save nil t)))










;; ========================================================================
;; ============================ Vuk Protesilaos ===========================
;; ========================================================================

(defun vuk/toggle-line-numbers ()
  "Toggles the display of line numbers. Applies to all buffers."
  (interactive)
  (if (bound-and-true-p display-line-numbers-mode)
      (global-display-line-numbers-mode -1)
    (global-display-line-numbers-mode)))


(defun vuk/toggle-whitespace ()
  "Toggles the display of indentation and space characters."
  (interactive)
  (if (bound-and-true-p whitespace-mode)
      (whitespace-mode -1)
    (whitespace-mode)))


(defun vuk/multi-line-next ()
  "Moves the pointer 10 lines down."
  (interactive)
  (next-line 10))


(defun vuk/multi-line-prev ()
  "Moves the pointer 10 lines up."
  (interactive)
  (previous-line 10))


(defun vuk/kill-line-backward ()
  "Kill line backwards from the position of the pointer to the
beginning of the line. This will not remove the line."
  (interactive)
  (kill-line 0))

(defun vuk/copy-eol ()
  "Copies from the pointer to the end of line."
  (interactive)
  (kill-ring-save (point) (point-at-eol))
  (message "Current line copied"))


(defun vuk/increase-frame-width ()
  "Increase the width of the frame by 5 pixels."
  (interactive)
  (let ((current-width (frame-width))
        (new-width (+ (frame-width) 5)))
    (set-frame-width nil new-width)))

(defun vuk/decrease-frame-width ()
  "Decrease the width of the frame by 5 pixels."
  (interactive)
  (let ((current-width (frame-width))
        (new-width (- (frame-width) 5)))
    (set-frame-width nil new-width)))

(defun vuk/increase-frame-height ()
  "Increase the height of the frame by 5 pixels."
  (interactive)
  (let ((current-height (frame-height))
        (new-height (+ (frame-height) 5)))
    (set-frame-height nil new-height)))

(defun vuk/decrease-frame-height ()
  "Decrease the height of the frame by 5 pixels."
  (interactive)
  (let ((current-height (frame-height))
        (new-height (- (frame-height) 5)))
    (set-frame-height nil new-height)))



;; ===============================================================
;; ======================== MY KEYBINDINGS =======================
;; ===============================================================

;; My Weird Mappings
(global-set-key (kbd "M-p") 'other-window)

;; Set keybindings for scrolling
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

;; Now I can go half page Up and Down with: C-v and M-v respectively.
(autoload 'View-scroll-half-page-forward "view")
(autoload 'View-scroll-half-page-backward "view")

;; Key chord for my functions or built-in actions
(global-set-key (kbd "C-S-n") 'vuk/multi-line-next)
(global-set-key (kbd "C-S-p") 'vuk/multi-line-prev)
(global-set-key (kbd "C-S-k") 'vuk/kill-line-backward)

;; Toggles
(global-set-key (kbd "C-c l") 'vuk/toggle-line-numbers)
(global-set-key (kbd "C-c i") 'vuk/toggle-whitespace)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
(global-set-key (kbd "C-c v") 'display-fill-column-indicator-mode)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)




(global-set-key (kbd "C-c y") 'vuk/copy-eol)

;; Additional Functionalities
(global-set-key (kbd "C-c +") 'vuk/increase-frame-width)
(global-set-key (kbd "C-c -") 'vuk/decrease-frame-width)
(global-set-key (kbd "C-c C-+") 'vuk/increase-frame-height)
(global-set-key (kbd "C-c C--") 'vuk/decrease-frame-height)

;; For Searching
(global-set-key (kbd "M-u") 'isearch-exit)
;; (define-key global-map (kbd "M-.") 'isearch-repeat-forward)
;; (define-key global-map (kbd "M-,") 'isearch-repeat-backward)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'")))
