// ignore_for_file: non_constant_identifier_names

//implementation of ELO algorithm to rank
import 'dart:math';

double Ra = 300.0;
double Rb = 200.0;
int K = 24;

double x1 = (Ra - Rb) / 400;
double x2 = (Rb - Ra) / 400;

double Ea = 1 / (1 + pow(10, x1));
double Eb = 1 / (1 + pow(10, x2));

int Sa = 1;
int Sb = 0;
double Ra1 = (Ra + K * (Sa - Ea));
double Rb1 = (Rb + K * (Sb - Eb));
