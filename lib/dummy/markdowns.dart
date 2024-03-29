class Markdowns {
  List<String> data = [
    ''' ### How Tech Has Shaped Film Making: The Film vs. Digital Debate Is Put to Rest  



![title image](https://www.wired.com/images_blogs/underwire/2010/10/toystory_0.jpg)    



> Without technology, it would be nearly impossible for Hollywood to produce the volume of films that it does.

MIT researchers have developed a type of neural network that learns on the job, not just during its training phase. These flexible algorithms, dubbed "liquid" networks, change their underlying equations to continuously adapt to new data inputs. The advance could aid decision making based on data streams that change over time, including those involved in medical diagnosis and autonomous driving.

"This is a way forward for the future of robot control, natural language processing, video processing --- any form of time series data processing," says Ramin Hasani, [the study's](https://arxiv.org/pdf/2006.04439.pdf) lead author. "The potential is really significant."

![Liquid neural](https://www.unite.ai/wp-content/uploads/2023/05/Featured-Blog-Image-Liquid-Neural-Networks-Definition-Applications-and-Challenges.jpg)

The research will be presented at February's AAAI Conference on Artificial Intelligence. In addition to Hasani, a postdoc in the MIT Computer Science and Artificial Intelligence Laboratory (CSAIL), MIT co-authors include Daniela Rus, CSAIL director and the Andrew and Erna Viterbi Professor of Electrical Engineering and Computer Science, and PhD student Alexander Amini. Other co-authors include Mathias Lechner of the Institute of Science and Technology Austria and Radu Grosu of the Vienna University of Technology.

Time series data are both ubiquitous and vital to our understanding the world, according to Hasani. "The real world is all about sequences. Even our perception --- you're not perceiving images, you're perceiving sequences of images," he says. "So, time series data actually create our reality."

He points to video processing, financial data, and medical diagnostic applications as examples of time series that are central to society. The vicissitudes of these ever-changing data streams can be unpredictable. Yet analyzing these data in real time, and using them to anticipate future behavior, can boost the development of emerging technologies like self-driving cars. So Hasani built an algorithm fit for the task.

Hasani designed a neural network that can adapt to the variability of real-world systems. Neural networks are algorithms that recognize patterns by analyzing a set of "training" examples. They're often said to mimic the processing pathways of the brain --- Hasani drew inspiration directly from the microscopic nematode, *C. elegans*. "It only has 302 neurons in its nervous system," he says, "yet it can generate unexpectedly complex dynamics."

Hasani coded his neural network with careful attention to how *C. elegans* neurons activate and communicate with each other via electrical impulses. In the equations he used to structure his neural network, he allowed the parameters to change over time based on the results of a nested set of differential equations.

This flexibility is key. Most neural networks' behavior is fixed after the training phase, which means they're bad at adjusting to changes in the incoming data stream. Hasani says the fluidity of his "liquid" network makes it more resilient to unexpected or noisy data, like if heavy rain obscures the view of a camera on a self-driving car. "So, it's more robust," he says.

There's another advantage of the network's flexibility, he adds: "It's more interpretable."

Hasani says his liquid network skirts the [inscrutability](https://news.mit.edu/2020/looking-black-box-deep-learning-neural-networks-0727) common to other neural networks. "Just changing the representation of a neuron," which Hasani did with the differential equations, "you can really explore some degrees of complexity you couldn't explore otherwise." Thanks to Hasani's small number of highly expressive neurons, it's easier to peer into the "black box" of the network's decision making and diagnose why the network made a certain characterization.

"The model itself is richer in terms of expressivity," says Hasani. That could help engineers understand and improve the liquid network's performance.

Hasani's network excelled in a battery of tests. It edged out other state-of-the-art time series algorithms by a few percentage points in accurately predicting future values in datasets, ranging from atmospheric chemistry to traffic patterns. "In many applications, we see the performance is reliably high," he says. Plus, the network's small size meant it completed the tests without a steep computing cost. "Everyone talks about scaling up their network," says Hasani. "We want to scale down, to have fewer but richer nodes."

Hasani plans to keep improving the system and ready it for industrial application. "We have a provably more expressive neural network that is inspired by nature. But this is just the beginning of the process," he says. "The obvious question is how do you extend this? We think this kind of network could be a key element of future intelligence systems."

This research was funded, in part, by Boeing, the National Science Foundation, the Austrian Science Fund, and Electronic Components and Systems for European Leadership.''',
  ];
}
