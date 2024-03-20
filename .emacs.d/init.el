;; ========================================================================
;; ========================== EMACS CONFIGURATION FILE ====================
;; ========================================================================

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


;;(setq mode-line-format nil)

;; ---------------------------------------------------------------------
;; --------------------------- SOME DEFAULTS ---------------------------
;; ---------------------------------------------------------------------

;; Kill Welcome-startup-screen
(setq inhibit-startup-screen t)

;; Custom Default path
;; (setq default-directory "C:/Users/krete/Desktop/Alat/Anti_filozof/Computers/Emacs/")

;; Set font
(set-frame-font "Iosevka Comfy Fixed 10" nil t)
;; (set-default-font "Iosevka Comfy Fixed 10" t)
;; (set-face-attribute 'default nil :font "Iosevka Comfy Fixed 10")


;; <TAB> = 4 <SPC>
;; Set tab width and enable indent-tabs-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; When "autofill" is on, hard-wrap at 79 characters
(setq-default fill-column 79)

;; Stop blinking of cursor
(blink-cursor-mode 0)

; Turn off the ring bell
(setq ring-bell-function 'ignore)

;; relativenumber, number
;;(setq display-line-numbers-type 'relative)
;;(global-display-line-numbers-mode t)

;; Prevents the screen to move up by half the screen when I'm down
(setq scroll-conservatively 101
      scroll-margin 0
      scroll-step 1)


;; ===================================================================
;; ============================ APPEARANCE ===========================
;; ===================================================================

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable menu items
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Get rid of the "- + X" around the frame
(setq default-frame-alist '((undecorated . t)))

;; Default size upon opening Emacs
(setq initial-frame-alist
      '((top . 200) (left . 350) (width . 85) (height . 30)))



;; =================================================================
;; ------------------------- AUTOMATIC -----------------------------
;; =================================================================
;; Ovo se automatski dodalo od strane Emacs Configuration fajla
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-date-style 'european)
 '(org-agenda-files
   '("c:/Users/krete/Desktop/Alat/Anti_filozof/Computers/Emacs/izbegavanje.org"))
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages
   '(aggressive-indent dired-preview emoji-display all-the-icons-completion all-the-icons-ibuffer all-the-icons epkg-marginalia marginalia vertico image-dired+ evil timu-spacegrey-theme writeroom-mode))
 '(visible-bell nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; =================================================================




;; -----------------------------------------------------------------
;; ---------------------------- MELPA ------------------------------
;; -----------------------------------------------------------------


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ----------------------------------------------------------------
;; ---------------------------- ELPA ------------------------------
;; ----------------------------------------------------------------
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)


;; Theme
(load-theme 'dracula t)

;; vertico (For mini-buffer)
(vertico-mode 1)

;; it will show a brief description of the command as well
;; as the keybinding associated with it (if any).
(marginalia-mode -1)

;; Delete the previous path when inserting new ~/A/B/C~/. ==> ~/.
(file-name-shadow-mode 1)
(add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)

;; Delete by moving to trash
(setq delete-by-moving-to-trash t)


;; =================================================================
;; ============================ ORG-MODE ===========================
;; =================================================================

;; Hide special character that are needed for: bold, italic, etc.
(setq org-hide-emphasis-markers t)

;; Display inline images
(setq org-startup-with-inline-images t)

(require 'org-mouse)
(setq make-backup-files nil)

;; Multiple keyword sets in one file
(setq org-todo-keywords '((sequence "TODO" "CHECK" "FIX" "WAITING" "READ" "IDEA"
                                     "TIDY" "|" "DONE" "CANCELLED")))

;; The way the Dates are being displayed
;; You can also run: M-x calendar-set-date-style
(set calendar-date-style 'european)

 ;; Display time as "21-11-2023 13:45" instead of "<2023-11-21 Mon 13:45>"'
(setq-default org-display-custom-times t)
(setq-default org-time-stamp-custom-formats '("<%d.%m.%Y>" . "<%d.%m.%Y %H:%M>"))

;; Don't ask me "Evaluate this emacs-lisp code block on your system? (yes or no)"
;; when exporting to .html from .org
(setq org-confirm-babel-evaluate nil)


;; ====================================================================
;; ============================ ORG-CAPTURE ===========================
;; ====================================================================

(setq org-capture-templates
      '(("w" "Work Templates" entry
	(file+headline "work.org" "Sve sto treba uraditi")
	"* RESPONSIBILITY  %?")
        
        ("p" "Personal Templates" entry
	(file+headline "personal.org" "Zanimljive ideje")
	"* IDEA %?")
        
        ("d" "Demo Templates" entry
	(file+headline "demo.org" "First heading")
	"* %^{Please write here} %?")
        
        ("o" "Options in prompt" entry
	(file+headline "demo.org" "Second heading")
	"* %^{Select your otpion|ONE|TWO|THREE} %?")
        
        ("t" "Task with a <TODAY> date" entry
	(file+headline "demo.org" "Third heading")
	"* %^{Select your otpion|ONE|TWO|THREE}\n SCHEDULED: %t\n Some more text %?")

        ("c" "Copy Template")
        ("cp" "Submenu Copy with <TODAY> date" entry
	(file+headline "demo.org" "Our third heading")
	"* %^{Select your otpion|ONE|TWO|THREE}\n SCHEDULED: %t\n  %?")

        ("ct" "Submenu Copy & Specify Date" entry
	(file+headline "demo.org" "Our third heading")
	"* %^{Select your otpion|ONE|TWO|THREE}\n SCHEDULED: %^t\n  %?")))




;; ==============================================================
;; ============================ DIRED ===========================
;; ==============================================================

;; So the the Icons are rendering in Dired
;; (load "~/all-the-icons-dired.el")

;; ls -1 instead of ls -l in DIRED
(setq delete-by-moving-to-trash t)

(setq dired-listing-switches "-hX  --group-directories-first")

(require 'dired-preview)

;; Default values for demo purposes
(setq dired-preview-delay 0.7)
(setq dired-preview-max-size (expt 2 20))
(setq dired-preview-ignored-extensions-regexp
      (concat "\\."
              "\\(mkv\\|webm\\|mp4\\|mp3\\|ogg\\|m4a"
              "\\|gz\\|zst\\|tar\\|xz\\|rar\\|zip"
              "\\|iso\\|epub\\|pdf\\)"))

;; Enable `dired-preview-mode' in a given Dired buffer or do it
;; globally:
(dired-preview-global-mode 1)


;; ==============================================================
;; ============================ HOOKS ===========================
;; ==============================================================
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


;; ==============================================================
;; =========================== MODELINE =========================
;; ==============================================================

(setq-default mode-line-format
              '("%e"
                my-modeline-buffer-name
                "  "
                my-modeline-major-mode))



;; "faces" are eseentially a way to specify or customize appearance of
;; text and other elements in Emacs
(defface my-modeline-background
  '((t :background "#3355bb" :foreground "white" :inherit bold))
  "Face with a red background for use on the mode line.")


(defun my-modeline--buffer-name ()
  "Return `buffer-name' with spaces around it."
  (format " %s " (buffer-name)))

(defvar-local my-modeline-buffer-name
    '(:eval
      (when (mode-line-window-selected-p)
        (propertize (my-modeline--buffer-name) 'face 'my-modeline-background)))
  "Mode line construct to display the buffer name.")

(put 'my-modeline-buffer-name 'risky-local-variable t)

(defun my-modeline--major-mode-name ()
  "Return capitalized `major-mode' as a string."
  (capitalize (symbol-name major-mode)))

(defvar-local my-modeline-major-mode
    '(:eval
        (list
         (propertize "🦄" 'face 'shadow)
         " "
         (propertize (my-modeline--major-mode-name) 'face 'bold)))
  "Mode line construct to display the major mode.")

(put 'my-modeline-major-mode 'risky-local-variable t)



;; ============================================================
;; ============================ VIM ===========================
;; ============================================================
;; (require 'evil)
;; (evil-mode 1)



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


(defun vuk/comment-eol ()
  "Comments out the line from the position of the points to the
end. The behaviour is not a toggle, meaning that subsequent
invocations will keep adding the comment mark."
  (interactive)
  (comment-region (point) (point-at-eol)))


(defun vuk/insert-80-dashes ()
  (interactive)
  (insert (make-string 80 ?-)))


(defun vuk/toggle-writeroom-and-line-numbers ()
  "Toggles writeroom-mode and line numbers."
  (interactive)
  ;;(vuk/toggle-line-numbers)
  (if (bound-and-true-p writeroom-mode)
      (writeroom-mode -1)
    (writeroom-mode 1)))


(defun vuk/select-inner-word ()
  "Select the whole word at point, regardless of cursor position within it."
  (interactive)
  (let ((beg (save-excursion (backward-word) (point)))
        (end (save-excursion (forward-word) (point))))
    (set-mark beg)
    (goto-char end)
    (activate-mark)))


(defun vuk/select-inner-sentence ()
  "Select the sentence at point."
  (interactive)
  (let ((beg (save-excursion
               (re-search-backward "[.!?\n$]" nil t)
               (forward-char 2)
               (point)))  ;; return current_cursor_position
        (end (save-excursion
               (re-search-forward "[.!?]" nil t)
               ;;(backward-char)
               (point)))) ;; return current_cursor_position
    (set-mark beg)
    (goto-char end)
    (activate-mark)))


(defun vuk/delete-inner-sentence ()
  "Select the sentence at point."
  (interactive)
  (let ((beg (save-excursion
               (re-search-backward "[.!?\n$]" nil t)
               (forward-char 2)
               (point)))  ;; return current_cursor_position
        (end (save-excursion
               (re-search-forward "[.!?]" nil t)
               (forward-char)
               (point)))) ;; return current_cursor_position
               (delete-region beg end)))

(defun vuk/delete-inner-word ()
  "Deletes entire word from anywhere within the word."
  (interactive)
  (let ((beg (save-excursion
               (re-search-backward "\\b" nil t)
               (point)))
        (end (save-excursion
               (re-search-forward "\\b" nil t)
               (forward-char)
               (point))))
    (delete-region beg end)))


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

;; Additional Functionalities
(global-set-key (kbd "C-c y") 'vuk/copy-eol)
(global-set-key (kbd "C-c g") 'insert-80-dashes)

;; Toggles
(global-set-key (kbd "C-c l") 'vuk/toggle-line-numbers)
(global-set-key (kbd "C-c i") 'vuk/toggle-whitespace)
(global-set-key (kbd "C-c w") 'vuk/toggle-writeroom-and-line-numbers)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
(global-set-key (kbd "C-c v") 'display-fill-column-indicator-mode)
(global-set-key (kbd "C-c c") 'org-capture)

;; Highlighting
(global-set-key (kbd "C-c h") 'vuk/select-inner-word)
(global-set-key (kbd "C-c s") 'vuk/select-inner-sentence)
(global-set-key (kbd "C-c d") 'vuk/delete-inner-sentence)
(global-set-key (kbd "C-c r") 'vuk/delete-inner-word)
(put 'narrow-to-region 'disabled nil)

;; My weird mappings
(global-set-key (kbd "C-M-n") 'completion-at-point)
(global-set-key (kbd "C-c +") 'vuk/increase-frame-width)
(global-set-key (kbd "C-c -") 'vuk/decrease-frame-width)
(global-set-key (kbd "C-c C-+") 'vuk/increase-frame-height)
(global-set-key (kbd "C-c C--") 'vuk/decrease-frame-height)

;; For Editing purposes
(global-set-key (kbd "C-M-p") 'backward-list)
(global-set-key (kbd "C-;") 'comment-dwim)
