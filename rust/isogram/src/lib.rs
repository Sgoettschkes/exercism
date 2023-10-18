pub fn check(candidate: &str) -> bool {
    let v: Vec<char> = candidate.to_lowercase().replace("-", "").replace(" ", "").chars().collect();
    let mut y = v.clone();

    y.sort();
    y.dedup();
    v.len() == y.len()
}
