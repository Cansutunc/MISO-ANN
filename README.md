# MISO-ANN
1- Graph of Raw Data
![image](https://user-images.githubusercontent.com/78976455/153629175-4cf73f93-763c-4bd5-ae37-e83be6278512.png)
This is the input-output graph of raw data set. 
Data set contains 10001 input and 10001 output data.
Since this data set is so complex, we need to do some operations on it in order to simply and 
make it ready for modelling. 
Normalization step is done.
Separation step is done. 1001 data used for training and another 1001 data used for the 
validation process.
Since model is not quite achieved I did not make test process.

2- TRAINING AND VALIDATION PROCESSES AND RESULTS OF ANN

ATTEMPT 1

2.1 1001 Data with 10 – 15 Neuron - Output of dataset is ordered from small to large
Normalization operation is done by scaling the data with 200. 
As a result of this operation data output is ranged between 1 to -1.
Separation step is done.
1001 data used for training and another 1001 data used for the 
validation process. 
10001 data was large to be worked on so decreased it to 1001 data. So the artificial neural 
network trained with 1001 inputs and 1001 outputs.
After that, the output data set was sorted from small to large for easier modelling, and inputs are 
organized according to the new order of outputs.

PROCESSED DATA GRAPH:
![image](https://user-images.githubusercontent.com/78976455/153642842-dc2c5e03-2935-4852-9d6a-f4c7340d213b.png)

RESULTS:

Training process is made for 10, 11, 12, 13, 14, 15 Neurons and results are observed as in the 
graphs.

The y_training vs Neuron Number Graph:
![image](https://user-images.githubusercontent.com/78976455/153643110-30993273-1a96-41ea-b7a5-41ea07836cb3.png)
The y_validation vs Neuron Number Graph:
![image](https://user-images.githubusercontent.com/78976455/153643191-6cd2ca49-bf42-4ad8-bf99-504af82d02ad.png)
![image](https://user-images.githubusercontent.com/78976455/153643243-a19f87bf-afa6-43a8-8a07-a24f3557feab.png)
y vs y^ graph of Model with 14 Neuron:
![image](https://user-images.githubusercontent.com/78976455/153643312-df52c929-4eea-4294-9a7e-4ababf8740d2.png)

Min. Training Error=327.1090 Norm_G=0.3121 logMSE=2.5147 ANN # of Iteration=50

<MISO_ANN_Validation> Validation Data Eror is 18.359653

CONCLUSION OF 1. ATTEMPT:
The data set is separeted as training and validation data for their purposes. 
Then, validation of each model obtained with the same training data performance achieved, from 
those knowledge had a graph of validation vs neuron number. By analyzing that graph observed 
the optimum model with optimum neuron number with least validation error.
And then by turning back to the algorithm to print out the y vs y^ graph of Model with least 
validation error. In this trail 6 different neuron number is observed. 10, 11, 12 ,13, 14, 15. By 
looking at the graphs it can be seen the model with 14 neuron has least error so results of that 
model with 14 neuron is observed.
Since 15 neuron model has less validation error there was so small difference with 14. Neuron so 
i choose the most optimum model as model with 14 neuron.
Training error was high in this attempt. So model could not be achieved properly. 
Reason of this might be the neuron number is less compared to complexity of the data set. 
Another reason might be the operations on the data set before modelling.

#ATTEMPT 2
2.2 1001 Data with 10 – 15 Neuron - Input of dataset is ordered from small to 
large

Since Input is ordered from small to large output is ordered with respect to that.
Normalization step is done by not using normalization but scaling with 200. As a result of this 
operation data output is ranged between 1 to -1. (I have could use normalization as weel )
Separation step is done by separating data set as 1001 data for training and 1001 data for 
validation.
The input of data set was sorted from small to large for better results and outputs are organized 
according to the new order of outputs.

PROCESSED DATA GRAPH:
![image](https://user-images.githubusercontent.com/78976455/153643595-00a5fea4-6ccf-444c-af97-e073af44a893.png)

RESULTS
The y_training vs Neuron Number Graph:
![image](https://user-images.githubusercontent.com/78976455/153643809-70a5aae4-f8e5-4e5a-a1e2-e5d950287c89.png)

The y_validation vs Neuron Number Graph:
![image](https://user-images.githubusercontent.com/78976455/153643893-99b2cd29-2950-4f4d-86eb-7d15fc9ff922.png)

Model with 13 Neuron Graphs :
![image](https://user-images.githubusercontent.com/78976455/153644014-bcde911a-a44f-42ed-a381-1793d230d72c.png)

Min. Training Error=314.1651 Norm_G=0.0345 logMSE=2.4972 ANN # of Iteration=50

<MISO_ANN_Validation> Validation Data Eror is 18.354439

Model with 15 Neuron Graphs:
![image](https://user-images.githubusercontent.com/78976455/153644118-63be1f4e-b666-4a4e-a985-7965c4020e66.png)

Min. Training Error=314.4065 Norm_G=0.1396 logMSE=2.4975 ANN # of Iteration=50
<MISO_ANN_Validation> Validation Data Eror is 18.333794

CONCULUSION OF 2. ATTEMPT

The data set is separeted as training and validation data for their purposes. 
Then, validation of each model obtained with the same training data performance achieved, from 
those knowledge had a graph of validation vs neuron number. By analyzing that graph observed 
the optimum model with optimum neuron number with least validation error.
And then by turning back to the algorithm to print out the y vs y^ graph of Model with least 
validation error. In this trail 6 different neuron number is observed. 10, 11, 12 , 13, 14, 15.
In this attempt Input was ordered first. By looking at the graphs we can Model with neuron 13 
and model with 15 neuron has less validation error so draw out their graphs.
Ordering inputs attempt is more succesful than ordering the outputs of the data.
Many training processes have been tried with many different processed versions of data set but 
unfortunately none of these attempts managed to be successful due to decreasing training 
error. There could be better results if I increase neuron number for seeing better models since 
data set is large. 

# ATTEMPT 3

2.3 1001 Data with 10 – 11 Neuron – Input or output not ordered this time
Output or input is not ordered.
Normalization step is done by using normalization this time, as a result of this operation data 
output is ranged between 1 to 0.
Separation step is done by separating data set as 1001 data for training and 1001 data for 
validation.

PROCESSED DATA GRAPH:
![image](https://user-images.githubusercontent.com/78976455/153644343-230b41d2-06b3-4c0b-adfe-9961a510bf96.png)

RESULTS:
![image](https://user-images.githubusercontent.com/78976455/153644395-46b1a79f-217b-42ac-8b04-6c773c2cfbaf.png)

![image](https://user-images.githubusercontent.com/78976455/153644443-05e63802-dcf3-4a08-b037-0b70540a0f1c.png)

Min. Training Error=80.4001 Norm_G=0.0910 logMSE=1.9053 ANN # of Iteration=50
<MISO_ANN_Validation> Validation Data Eror is 9.238618

CONCULUSION OF 3. ATTEMPT

The data set is separeted as training and validation data for their purposes. 
Then, validation of each model obtained with the same training data performance achieved, from 
those knowledge had a graph of validation vs neuron number. By analyzing that graph observed 
the optimum model with optimum neuron number with least validation error.
And then by turning back to the algorithm to print out the y vs y^ graph of Model with least 
validation error. In this trail 2 different neuron number is observed. 10, 11
In this attempt Input was ordered first. By looking at the graphs we can Model with neuron 10.
This attempt is less successful than second attempt as model visual but training error is less 
when compared with second attempt.

