#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )

function hash_root() {
     $SCRIPT_DIR/hash_root.py $@
}

if [[ -z "${DEPLOY_ENV}"  ]]; then
      export TERM=xterm # is not set in CI
fi

bold=`tput bold`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

declare -A hashes=( 
["out/estimatedparams.root"]="eaf5f279f1a0287edf4e91d912ffe0ade7d9a6b76183b54f102c4303853f29db"
["out/fatras_particles_final.root"]="74005279825689667001dc2ebc1a8ca22d07d2b739b8e84e7c399286caf15026"
["out/fatras_particles_initial.root"]="8c80c1b936281f7ac9b583d3be8c717c0ef7eab2d1fa689dd8ca53310952532a"
["out/hits.root"]="6edc44e8abd27470f425fdfae241a47f683f9330cc6be04457b68f809ba3c17d"
["out/measurements.root"]="24e293760c6fdc5b2d20d0e1a9cc5827c9b0204afbf9c3707ccda5769ee3ed9b"
["out/performance_ckf.root"]="9fe19b5510a6d9117aa2f8eb4c06701dfb1c8d3656c7a173bada3099a1549867"
["out/performance_seeding_hists.root"]="57ac79f54cc1cd730c40f97c3cb5a477d4f7e49ec772fe2021177ca18baff51c"
["out/performance_seeding_trees.root"]="29523bf62e0ae22f2e3b9393ac6ba77205a43d9ad85c17f5cbe4d63528b5a12b"
["out/trackstates_ckf.root"]="01b66ded1dec5266e41755681b81b9af256b87f2e00d3cf7566fc9976404d34b"
["out/tracksummary_ckf.root"]="244d8afafd015c20218534e9150f877d0ee21ca9b93640f54434b16a13ac7029"
)

# echo ${hashes[moo]}

ec=0
for f in out/*.root; do
      expected=${hashes[$f]}
      hash=$(hash_root $f)
      echo $f $hash
      if [ $hash != $expected ]; then
            echo -e "${bold}${red}Hash mismatch for $f:"
            echo "   $hash"
            echo "!= $expected"
            echo -e -n "${reset}"
            ec=1
      fi
done

exit $ec
