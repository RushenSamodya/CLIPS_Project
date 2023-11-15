(deffacts startup
    (start)
)

(defrule pain
    ?start <- (start)
    =>
    (printout t "Is the pain constant or intermittent? [constant|intermittent] : ")
    (assert (pain (read)))
    (retract ?start)
)

(defrule constant-pain
    (pain constant)
    =>
    (printout t "Is there any swelling around the affected area? [yes|no] : ")
    (assert (swelling (read)))
)

(defrule swelling-yes
    (pain constant)
    (swelling yes)
    =>
    (printout t "Is there any pus or discharge from the affected area? [yes|no] : ")
    (assert (pus-discharge (read)))
)

(defrule abscess-diagnosis
    (pain constant)
    (swelling yes)
    (pus-discharge yes)
    =>
    (printout t "Possible abscess. Urgent dental attention needed.")
)

(defrule inflammation-diagnosis
    (pain constant)
    (swelling yes)
    (pus-discharge no)
    =>
    (printout t "Possible inflammation. Recommend a visit to the dentist.")
)

(defrule swelling-no
    (pain constant)
    (swelling no)
    =>
    (printout t "Is there any visible decay on the affected tooth? [yes|no] : ")
    (assert (visible-decay (read)))
)

(defrule cavity-diagnosis
    (pain constant)
    (swelling no)
    (visible-decay yes)
    =>
    (printout t "Possible cavity. Recommend a visit to the dentist for examination and filling.")
)

(defrule sensitivity-diagnosis
    (pain constant)
    (swelling no)
    (visible-decay no)
    =>
    (printout t "Possible tooth sensitivity.")
)

(defrule intermittent-pain
    (pain intermittent)
    =>
    (printout t "Does the pain worsen with hot or cold substances? [yes|no] : ")
    (assert (hot-cold-response (read)))
)

(defrule hot-cold-yes
    (pain intermittent)
    (hot-cold-response yes)
    =>
    (printout t "Is there any visible damage to the tooth? [yes|no] : ")
    (assert (visible-damage (read)))
)

(defrule cavity-diagnosis-hot-cold
    (pain intermittent)
    (hot-cold-response yes)
    (visible-damage yes)
    =>
    (printout t "Possible cavity. Recommend a visit to the dentist for filling.")
)

(defrule chewing-biting
    (pain intermittent)
    (hot-cold-response yes)
    (visible-damage no)
    =>
    (printout t "Is there any pain when chewing or biting? [yes|no] : ")
    (assert (chewing-biting-response (read)))
)

(defrule cracked-tooth-diagnosis
    (pain intermittent)
    (hot-cold-response yes)
    (visible-damage no)
    (chewing-biting-response yes)
    =>
    (printout t "Possible cracked tooth. Recommend a visit to the dentist for evaluation.")
)

(defrule grinding-clenching-diagnosis
    (pain intermittent)
    (hot-cold-response yes)
    (visible-damage no)
    (chewing-biting-response no)
    =>
    (printout t "Possible grinding or clenching.")
)

(defrule hot-cold-no
    (pain intermittent)
    (hot-cold-response no)
    =>
    (printout t "Is there any pain when eating sweet or acidic foods? [yes|no] : ")
    (assert (sweet-acidic-response (read)))
)

(defrule decay-erosion-diagnosis
    (pain intermittent)
    (hot-cold-response no)
    (sweet-acidic-response yes)
    =>
    (printout t "Possible tooth decay or enamel erosion. Recommend a visit to the dentist.")
)

(defrule sensitivity-diagnosis-sweet-acidic
    (pain intermittent)
    (hot-cold-response no)
    (sweet-acidic-response no)
    =>
    (printout t "Possible tooth sensitivity.")
)

; (defrule conclude-diagnosis
;     (not (start))
;     =>
;     (printout t "Thank you for using the Dentist Expert System." crlf)
;     (printout t "Based on your responses, we recommend consulting a dentist for a thorough examination." crlf)
;     (printout t "Have a good day!" crlf)
; )
   
