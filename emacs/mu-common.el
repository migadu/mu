;;; mu-common.el -- part of mu
;;
;; Copyright (C) 2011 Dirk-Jan C. Binnema

;; Author: Dirk-Jan C. Binnema <djcb@djcbsoftware.nl>
;; Maintainer: Dirk-Jan C. Binnema <djcb@djcbsoftware.nl>
;; Keywords: email
;; Version: 0.0

;; This file is not part of GNU Emacs.
;;
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; mu message has functions to display a message

;;; Code:

(require 'cl)

(defvar mu-binary "/home/djcb/src/mu/src/mu" "name/path of the mu executable")
(defvar mu-muile-binary "/home/djcb/src/mu/toys/muile/muile"
  "name/path of the muile executable")
(defvar mu-home nil
  "path where mu stores it's data or nil for the defaults (typically, ~/.mu)")

(defvar mu-date-format-short "%x %X" "date format (in strftime(2)
notation) e.g. for mail headers")

(defvar mu-date-format-long "%c" "date format (in strftime(2)
notation) for the mail view and in replied/forwarded message quotations")


(defvar mu-folder-draft "/home/djcb/Maildir/")

(defface mu-date-face    '((t (:foreground "#8c5353"))) "") 
(defface mu-subject-face '((t (:foreground "#dfaf8f"))) "") 
(defface mu-from-face    '((t (:foreground "#7f9f7f"))) "") 
(defface mu-to-face      '((t (:foreground "#7f6655"))) "")
(defface mu-cc-face      '((t (:foreground "#7f6666"))) "")
(defface mu-bcc-face     '((t (:foreground "#7f6677"))) "") 
(defface mu-body-face    '((t (:foreground "#8cd0d3"))) "") 
(defface mu-header-face  '((t (:foreground "#7f9f7f"))) "") 
(defface mu-size-face    '((t (:foreground "#889f7f"))) "") 
(defface mu-body-face    '((t (:foreground "#dcdccc"))) "") 
(defface mu-flag-face    '((t (:foreground "#dc56cc"))) "") 

(defface mu-unread-face    '((t (:bold t))) "") 
(defface mu-face         '((t (:foreground "Gray" :italic t))) "")

(defvar mu-own-address "djcb" "regexp matching my own address")

(defun mu-binary-version ()
  "get the version of the mu binary"
  (let ((cmd (concat mu-binary
	       " --version | head -1 | sed 's/.*version //'")))
    (substring (shell-command-to-string cmd) 0 -1)))

(defun mu-inspect (path)
  "inspect message in a guile environment"
  (let ((cmd (concat mu-muile-binary " --msg='" path "'")))
    (ansi-term cmd "*mu-inspect")))

;; (defalias mu-find    mu-headers-find)
;; (defalias mu-display mu-message-display)

(defun mu-str (str)
  "return STR propertized as a mu string (for info, warnings
etc.)"
  (propertize str 'face 'mu-face 'intangible t))

(setq mu-find-fields
  '(
     (:date          .  20)
     (:flags         .   4)
     (:from-or-to    .  22)
     (:size          .   8)
     (:subject       .  40)))
(setq mu-find-date-format "%x %X")

(setq mu-own-address-regexp "djcb\\|diggler\\|bulkmeel")

	
(provide 'mu-common)