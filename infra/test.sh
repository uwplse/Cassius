#!/bin/sh
set -e

FWT_PATH=${FWT_PATH:-$HOME/src/fwt/}
CSSWG_PATH=${CSSWG_PATH:-$HOME/src/web-platform-tests/css/CSS2}
THREADS=6

mkdir -p "$FWT_PATH"
mkdir -p "$CSSWG_PATH"

for FWT in \
    adventurewebsitetemplate airsportswebsitetemplate amusementparkwebsitetemplate applefarm \
    armyacademywebsitetemplate astronomywebsitetemplate backupsoftwarewebtemplate barwebsitetemplate \
    beachresort beachresortwebsitetemplate bikegearwebsitetemplate bookauthorportfoliowebtemplate \
    businessanalystwebsitetemplate businessexpertswebsitetemplate businessnewswebtemplate businesssolutions \
    businesssolutionwebtemplate businessworldtemplate cakewebsitetemplate cardiologywebsitetemplate \
    carracingwebtemplate carrepairshop cartoonappswebtemplate childrensappwebsitetemplate \
    cinematheaterwebsitetemplate coffeewebsitetemplate cookingrecipewebtemplate corporateconsultantwebtemplate \
    cruisevacationtemplate customshirtwebtemplate denimjeanswebtemplate displaywebsitetemplate \
    drinkingjuicewebtemplate ecoliving ecologicalwebsitetemplate eternalbeautyessentialswebtemplate \
    familychessclub fantasygamewebtemplate finemindsmarketingwebtemplate firefighterwebsitetemplate \
    fishingwebsitetemplate footballwebsitetemplate furnitureshopwebsitetemplate gadgetshopwebsitetemplate \
    gamewebsitetemplate gardenwalkthrough genericwebsitetemplate hairrepairwebsitetemplate \
    hairstylesalon healthylifetemplate helicoptertransportationwebtemplate herdesignswebtemplate \
    highfashion icecreamwebsitetemplate iphonegamewebtemplate islandhotelwebsitetemplate \
    lawfirm lawfirmwebsitetemplate logistics lollipops \
    madillustratorsportfoliotemplate magictree makeupwebsitetemplate medicalhospitalwebsitetemplate \
    morumallwebsitetemplate musicartistwebtemplate musicschoolwebsitetemplate mustacheenthusiast \
    neodance ngowebsitetemplate omorfiumgamingwebsite originarchitectswebsitetemplate \
    paintrepublic paredeswinerywebsitetemplate personalizedwebtemplate personalwebsitetemplate \
    petshoptemplate photographywebsitetemplate puppy rehabilitation-yoga \
    resortandcountryclubwebtemplate retrodiner running scienceclubwebsitetemplate \
    snackswebsitetemplate socialadvicewebsitetemplate space-science sportinggoodswebtemplate \
    summercamp sushihanii tailorshopwebsitetemplate themargaritafragrancewebtemplate \
    tourismsurfing treepreservation vinylrecordshopwebtemplate weddingblog \
    womenclothing woodworkingwebsitetemplate yogawebsitetemplate zerotype;
do
    FILE=$FWT_PATH/$FWT.zip
    DIR=$FWT_PATH/$FWT/$FWT

    if [ ! -f "$FILE" ]; then
        curl -L -s https://freewebsitetemplates.com/download/"$FWT"/ > "$FILE"
    fi

    if [ ! -s "$FILE" ]; then
        printf "ERROR! Downloaded empty file in %s\n" "$FILE"
        rm "$FILE"
        exit 1
    fi

    if [ ! -d "$DIR" ]; then
        mkdir -p "$FWT_PATH/$FWT"
        if hash fuse-zip &>/dev/null; then
            fuse-zip -r "$FILE" "$FWT_PATH/$FWT"
        else
            unzip "$FILE" -d "$FWT_PATH/$FWT"
        fi
    fi
done

make clean
rm -f reports/rkt/* reports/json/*

for CSSWG in \
    abspos borders box-display box cascade floats-clear \
    floats linebox margin-padding-clear normal-flow positioning text;
do
    echo bench/css/$CSSWG.rkt
done | xargs make -j$THREADS bench/fwt.rkt

make FWT_PATH="$FWT_PATH" FLAGS="--verbose --threads $THREADS" \
     reports/fwt.html reports/vizassert.html reports/csswg.html reports/specific.html \
     reports/modular.html reports/minimized.html # Currently infinite loops

mkdir -p reports/rkt/
mkdir -p reports/json/
cp bench/fwt.rkt bench/css/*.rkt reports/rkt/
mv reports/*.json reports/json/
