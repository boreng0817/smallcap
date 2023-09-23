root = "experiments/rag_7M_gpt2/"
ckps = ["checkpoint-4428", 
        "checkpoint-8856", 
        "checkpoint-13284", 
        "checkpoint-17712", 
        "checkpoint-22140", 
        "checkpoint-26568", 
        "checkpoint-30996", 
        "checkpoint-35424", 
        "checkpoint-39852", 
        "checkpoint-44280"]
res_path = "/test_res.txt" 


out_li = []
METRIC = "ckpts, Bleu_1, Bleu_2, Bleu_3, Bleu_4, METEOR, CIDEr, SPICE"
BASELINE = "SMALLCAP (in paper), -, -, -, 37.0, 27.9, 119.7, 21.3"

for ckp in ckps:
    f = open(f'{root}{ckp}{res_path}', 'r')
    li = [ckp]
    for line in f.readlines():
        metric, score = line.split()
        li.append(score)
    out_li.append(li)
    f.close()

f = open("total_result.csv", "w")
f.write(METRIC + "\n")
for l in out_li:
    f.write(", ".join(l) + "\n")
f.write(BASELINE + "\n")
f.close()
