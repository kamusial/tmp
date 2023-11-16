*** Variables ***
${string}   doggy
@{list}     first   2nd     3rd     and next    and last
@{list of nubers}    1    2    3    4    5
&{dictionary}    word=${string}    number=30    list=@{list}
@{first names}    Kamil    Eddi    Kimberly    Abdul
@{last names}    Kowalski    Malinowski    Nowak    Wąs

*** Test Cases ***

For Loop In Range 10
    FOR    ${i}    IN RANGE    10
        Log    ${i}
        Log to console    number:${i}
    END

For Loop In Range 4 10
    FOR    ${i}    IN RANGE    4    10
        IF    ${i} == 6    BREAK
            Log    ${i}
    END

For Loop In Range 4 30 3
    FOR    ${i}    IN RANGE    4    30    3
        IF    ${i} == 13    CONTINUE
            Log    ${i}
    END

Nest loops
    @{alphabets}    Create List     a    b    c    d
    Log    ${alphabets}
    @{numbers}    Create List    ${1}    ${2}    ${3}
    Log    ${numbers}
        FOR    ${letter}    IN    @{alphabets}
            FOR    ${number}    IN    @{numbers}
                Log to console    ${letter}${number}
            END
        END

