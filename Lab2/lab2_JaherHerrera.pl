% OBJECT IDENTIFICATION SYSTEM

electronic(smartphone).
electronic(computer).
electronic(fridge).
electronic(tv).
not_electronic(stove).
not_electronic(bed).
not_electronic(chair).
not_electronic(wardrobe).
not_electronic(door).
not_electronic(backpack)

is_technological(X) :- electronic(X).
is_non_technological(X) :- not_electronic(X).

small(smartphone).
small(computer).
large(fridge).
small(tv).
small(stove).
large(bed).
small(chair).
large(wardrobe).
large(door).
small(backpack).

is_portable(X) :- small(X).
is_not_portable(X) :- large(X).


ask(Question,Answer) :-	
    write(Question), write('(yes/no):'), nl,	
    read(Answer).

identify_object(Object) :-
    write("Think on one of these objects: smartphone, computer, fridge, tv, stove, bed, chair, wardrobe, door, backpack"), nl,
    ask("Is your object electronic?", Electronic),
    (Electronic == yes ->
        ask("Is your object easily movable?", Portable),
        (Portable == yes ->
            ask("Do you often take your object with you?", Everyday),
            (Everyday == yes -> Object = [smartphone, computer]
            ;
            ask("Is the object in your bedroom?", InRoom),
            (InRoom == yes -> Object = tv)
            )
        ;
            (Object = [fridge, stove])
        )
    ;
        ask("Can you sit on your object?", SitOn),
        (SitOn == yes -> Object = [chair, bed]
        ;
        ask("Do you often take your object with you?", Everyday),
        (Everyday == yes -> Object = backpack
        ;
        (Object = [wardrobe, door])
        )
        )
    ),
    write("I think the object is: "), write(Object), nl.