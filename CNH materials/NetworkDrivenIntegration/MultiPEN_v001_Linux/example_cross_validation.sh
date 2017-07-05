#!/bin/sh
# script to test the deployed MultiPEN application
# Module: CrossValidation

#The script example_cross_validation.sh is provided to test CrossValidation module
#Copyright (C) 2016  Perla Rey
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.


#chance mcrpath accordingly (MATLAB runtime compiler)
mcrpath="/usr/local/MATLAB/R2015b"
OutputDirectory="ExampleOutputs/"
ExpressionData="ExampleInputs/expressionData.txt"
Interactions="ExampleInputs/interactionMatrix.txt"
SampleClass="ExampleInputs/sampleClass.txt"
Folds=3

# Run MultiPEN: CrossValidation
# Syntax: $MultiPEN CrossValidation $OutputDirectory $ExpressionData $Interactions $SampleClass $lambdas $Folds $NumIterations
# This example executes CrossValidaton with default number of interactions (numIter)

./run_MultiPEN.sh $mcrpath CrossValidation $OutputDirectory $ExpressionData $Interactions $SampleClass "[0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 1 10]" $Folds

