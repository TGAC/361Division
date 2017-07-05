#!/bin/sh
# Script to test the deployed MultiPEN application v.0.0.1
# Module: PCA
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
mcrPath="/usr/local/MATLAB/MATLAB_Runtime"
OutputDirectory="ExampleOutputs/"
ExpressionData="ExampleInputs/expressionData.txt"
Groups="ExampleInputs/groups.txt"


# Run MultiPEN: PCA
# Syntax: $MultiPEN PCA $OutputDirectory $ExpressionData $Groups $Threshold $PlotTitle
./run_MultiPEN.sh $mcrPath PCA $OutputDirectory $ExpressionData $Groups 0 "example PCA"
