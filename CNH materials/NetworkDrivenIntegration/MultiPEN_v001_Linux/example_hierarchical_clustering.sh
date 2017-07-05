#!/bin/sh
# Script to test the deployed MultiPEN application v.0.0.1
# Module: HierarchicalClustering
#
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


# Run MultiPEN: HierarchicalClustering
# Syntax: $MultiPEN HierarchicalClustering $OutputDirectory $ExpressionData $Threshold $PlotTitle

./run_MultiPEN.sh $mcrpath HierarchicalClustering $OutputDirectory $ExpressionData 0 "Using example expression data"
