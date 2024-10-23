#!/bin/bash

# remove dupulicate
bcftools norm -d both --threads=4 caigebarley__53355variants__807individuals.vcf -O z -o caigebarley__53355variants__807individuals_mkdup.vcf

# imputation
beagle gt=caigebarley__53355variants__807individuals.vcf out=caigebarley__53355variants__807individuals_imp
