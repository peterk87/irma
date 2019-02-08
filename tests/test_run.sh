#!/usr/bin/env bash
set -Eeuo pipefail

err_report() {
  echo -e "\e[1m\e[31mError on line $(caller)\e[0m" >&2
}

trap "err_report" ERR

if [ -r ../LABEL ];then
	LABEL=../LABEL
else
	LABEL=$(which LABEL)
fi


if [ -r ../IRMA ];then
	IRMA=../IRMA
else
	IRMA=$(which IRMA)
fi


 
echo -e "\e[1m\e[33mRunning LABEL test\e[0m"
$LABEL test1.fa label-test H9v2011

grep -q "GQ373074" label-test_final.txt
grep -q "EF154979" label-test_final.txt
echo -e "\e[1m\e[32mPASS\e[0m"

echo
echo -e "\e[1m\e[33mRunning IRMA test\e[0m"
echo
$IRMA FLU test2.fastq irma-test
# fasta files for each of the 8 segments of influenza
test "$(ls irma-test/amended_consensus/*.fa | wc -l)" -eq 8
echo -e "\e[1m\e[32mPASS\e[0m"
