//
//  CategoryViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/28/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tempCategories : [String] = ["Adjuvants, Immunologic ","Adjuvants, Pharmaceutic ","Adrenal Cortex Hormones ","Adrenal Steroid Synthesis Inhibitors ","Adrenergic Agents ","Adrenergic Agonists ","Adrenergic alpha-1 Receptor Agonists ","Adrenergic alpha-1 Receptor Antagonists ","Adrenergic alpha-2 Receptor Agonists ","Adrenergic alpha-2 Receptor Antagonists ","Adrenergic alpha-Agonists ","Adrenergic alpha-Antagonists ","Adrenergic Antagonists ","Adrenergic beta-1 Receptor Agonists ","Adrenergic beta-1 Receptor Antagonists ","Adrenergic beta-2 Receptor Agonists ","Adrenergic beta-2 Receptor Antagonists ","Adrenergic beta-3 Receptor Agonists ","Adrenergic beta-3 Receptor Antagonists ","Adrenergic beta-Agonists ","Adrenergic beta-Antagonists ","Adrenergic Effect ","Adrenergic Neurohumor Depleters ","Adrenergic Neuron Agents ","Adrenergic Release Inhibitors ","Adrenergic Synthesis Inhibitors ","Adrenergic Uptake Inhibitors ","Aerosol Propellants ","Affinity Labels ","Agglutinins ","Aggregation Inhibitors ","Agrochemicals ","Air Pollutants ","Air Pollutants, Environmental ","Air Pollutants, Occupational ","Air Pollutants, Radioactive ","Alcohol Deterrents ","Aldosterone Antagonists ","Alkylating Agents ","alpha-Cysteine Protease Inhibitors ","alpha-Glucosidase Inhibitors ","Alpha-Neurotoxins ","Amebicides ","Amines, Sympathomimetic ","Amphiphilic Agents ","Ampholytes ","Amylin Mimetics ","Amylin Receptor Agonists ","Anabolic Agents ","Anabolic Effect ","Analeptics ","Analgesics ","Analgesics, Anti-Inflammatory ","Analgesics, Non-Narcotic ","Analgesics, Opioid ","Androgen Antagonists ","Androgen Effect ","Androgen Receptor Antagonists ","Androgen Synthesis Inhibitors ","Androgens ","Anesthetic Effect ","Anesthetic Gases ","Anesthetics ","Anesthetics, Combined ","Anesthetics, Dissociative ","Anesthetics, General ","Anesthetics, Inhalation ","Anesthetics, Intravenous ","Anesthetics, Local ","Anesthetics, Topical ","Angiogenesis Factor Inhibitors ","Angiogenesis Inducing Agents ","Angiogenesis Inhibitors ","Angiogenesis Modulating Agents ","Angiotensin II Type 1 Receptor Blockers ","Angiotensin II Type 2 Receptor Blockers ","Angiotensin Receptor Antagonists ","Angiotensin-Converting Enzyme Inhibitors ","Anion Exchange Resins ","Antacids ","Anthelmintics ","Anti-Allergic Agents ","Anti-Androgen Effect ","Anti-Angiogenesis Effect ","Anti-Anxiety Agents ","Anti-Anxiety Effect ","Anti-Arrhythmia Agents ","Anti-Arrhythmia AgentsE ","Anti-Asthmatic Agents ","Anti-Bacterial Agents ","Anti-Dyskinesia Agents ","Anti-HIV Agents ","Anti-Infective Agents ","Anti-Infective Agents, Local ","Anti-Infective Agents, Urinary ","Anti-Inflammatory Agents ","Anti-Inflammatory Agents, Non-Steroidal ","Anti-Mycobacterial Agents ","Anti-Obesity Agents ","Anti-Retroviral Agents ","Anti-Rheumatic Agents, Non-Steroidal ","Anti-Ulcer Agents ","Antibiotics ","Antibiotics, Antifungal ","Antibiotics, Antineoplastic ","Antibiotics, Antitubercular ","Antibiotics, Cytotoxic ","Anticarcinogenic Agents ","Anticarcinogenic Effect ","Anticestodal Agents ","Anticholesteremic Agents ","Anticholinergic Agents ","Anticoagulants ","Anticoccidial Agents ","Anticonvulsants ","Antidepressive Agents ","Antidepressive Agents, Second-Generation ","Antidepressive Agents, Tricyclic ","Antidiabetics ","Antidiarrheals ","Antidiuretic Agents ","Antidiuretic Effect ","Antidiuretic Hormone Receptor Antagonists ","Antidotes ","Antiemetic Effect ","Antiemetics ","Antiepileptic Agents ","Antifibrillatory Agents ","Antifibrinolytic Agents ","Antiflatulents ","Antifoaming Agents ","Antifungal Agents ","Antihemorrhagics ","Antihistamines, Classical ","Antihypertensive Agents ","Antihyperuricemics ","Antilipemic Agents ","Antimalarials ","Antimanic Agents ","Antimanic Effect ","Antimetabolites ","Antimetabolites, Antineoplastic ","Antimitotic Agents ","Antimutagenic Agents ","Antimutagenic Effect ","Antinematodal Agents ","Antineoplastic Agents ","Antineoplastic Agents, Alkylating ","Antineoplastic Agents, Hormonal ","Antineoplastic Agents, Immunological ","Antineoplastic Agents, Phytogenic ","Antinociceptive Agents ","Antioxidant Effect ","Antioxidants ","Antiparasitic Agents ","Antiparkinson Agents ","Antiperistaltic Agents ","Antiperspirants ","Antiplatelet Agents ","Antiplatyhelmintic Agents ","Antiprotozoal Agents ","Antipruritics ","Antipsychotic Agents ","Antipsychotic Effect ","Antipyretic Effect ","Antipyretics ","Antiresorptive Agents ","Antirheumatic Agents ","Antirheumatic Drugs, Disease-Modifying ","Antischistosomal Agents ","Antiseptics, Urinary ","Antisickling Agents ","Antispasmodic Effect ","Antispasmodics ","Antispermatogenic Agents ","Antispermatogenic Effect ","Antisyphilitic Agents ","Antithrombins ","Antithrombotic Agents ","Antithyroid Agents ","Antithyroid Effect ","Antitreponemal Agents ","Antitrichomonal Agents ","Antitubercular Agents ","Antitussive Agents ","Antiviral Agents ","Appetite Depressants ","Appetite Stimulants ","Arachidonate 12-Lipoxygenase Inhibitors ","Arachidonate 15-Lipoxygenase Inhibitors ","Arachidonate 5-Lipoxygenase Inhibitors ","Aromatase Inhibitors ","Aromatic Amino Acid Decarboxylase Inhibitors ","Artificial Sweeteners ","Aspirin-Like Agents ","Astringent Effect ","Astringents ","Autonomic Agents "]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = tempCategories[indexPath.row]
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
