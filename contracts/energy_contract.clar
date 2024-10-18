;; Decentralized Energy Trading Smart Contract

;; Data Maps
(define-map producers principal { energy-available: uint, energy-price: uint })
(define-map consumers principal { energy-consumed: uint, total-spent: uint })
(define-map energy-sold principal uint)
(define-map energy-purchased principal uint)

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-not-owner (err u100))
(define-constant err-invalid-amount (err u101))
(define-constant err-producer-not-found (err u102))
(define-constant err-insufficient-energy (err u103))
(define-constant err-insufficient-funds (err u104))

;; Read-only functions
(define-read-only (get-producer-info (producer principal))
  (ok (default-to 
    { energy-available: u0, energy-price: u0 } 
    (map-get? producers producer))))

(define-read-only (get-consumer-info (consumer principal))
  (ok (default-to 
    { energy-consumed: u0, total-spent: u0 } 
    (map-get? consumers consumer))))