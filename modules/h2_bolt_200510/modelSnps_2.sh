#
#
# modelSnps
#
# ----------------------------------------------------


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

module load plink2/1.90beta5.4

#samples=../../data/ukbCMR.keep.plink
pth=${DIR}/../../data


# -----------------------------------------


plink --bed ${pth}/ukbMriSubset.bed  \
    --bim ${pth}/ukbMriSubset.bim  \
    --fam ${pth}/ukbMriSubset.fam \
    --remove ${pth}/sample2exclude.all.snpTest_200506.list.bolt \
    --maf 0.01 \
    --geno 0.05 \
    --indep-pairwise 50 5 0.9 \
    --write-snplist \
    --out ${DIR}/modelSnps/modelSnps_2





grep -Fxv -f modelSnps/modelSnps_MHC_chr8inversion.out modelSnps/modelSnps_2.prune.in | wc
grep -Fxv -f modelSnps/modelSnps_MHC_chr8inversion.out \
    modelSnps/modelSnps_2.prune.in > modelSnps/modelSnps_all_2.txt


