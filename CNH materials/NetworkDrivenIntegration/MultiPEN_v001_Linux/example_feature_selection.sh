#!/bin/sh
# script to test the deployed MultiPEN application
# Module: Feature Selection

#The script example_feature_selection.sh is provided to test FeatureSelection function
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


if [ $# -eq 0 ]
   then
      lambda=0.0001
   else
      lambda=$1
fi

#chance mcrpath accordingly (MATLAB runtime compiler)
mcrpath="/usr/local/MATLAB/R2015b"
OutputDirectory="ExampleOutputs/"
ExpressionData="ExampleInputs/expressionData.txt"
Interactions="ExampleInputs/interactionMatrix.txt"
SampleClass="ExampleInputs/sampleClass.txt"

# Run MultiPEN: feature selection 
# with default decision threshold (D) and number of interactions (numIter)

./run_MultiPEN.sh $mcrpath FeatureSelection $OutputDirectory $ExpressionData $Interactions $SampleClass $lambda

