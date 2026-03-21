# Impromptu Zoom – Max, Jordan & Graham: OpenImpact + OASIS (March 20, 2026)

**VIEW RECORDING** – 56 mins (No highlights): https://fathom.video/share/izC5KhWYQjL_AMisttgtHsEHFdjJS_RJ

---

## 0:07 – OpenImpact: Background & Demo

**Jordan (~):**
Okay, so Max and Jordan are here. Well, formerly Jordan, Friday the 20th. Okay, so I want to show you something that was created along the way, and I want to see what we need to do with it.

*(Screen sharing started — [WATCH](https://fathom.video/share/izC5KhWYQjL_AMisttgtHsEHFdjJS_RJ?timestamp=22.7897))*

Let me tell you a story about a guy named Gary Glass, who Jordan went to UCLA MBA with, and they, back in 2015 or so, they were talking about what would be needed if, you know, a decade down the road, humanity actually had to be able to rapidly govern itself, make decisions, allocate resources.

**Max G:**
Yeah. Yeah.

**Jordan (~):**
So Gary was already, you know, five, ten years into the creation of something that he calls Current, which is kind of a holofractal data architecture, let's say, or something like that. But they're using it for lots of things, including FAA compliant jet operations and project-based learning in universities, that kind of thing. So you kind of understand all the workflows of those things, why they're difficult, whatever. Then he came off of some time as the CTO on one of the first Wall Street digital currency exchanges. He had also done things like setting up Gilead's global lab management system — scientific rigor, data chain of custody, you know, all that.

And we needed a system that would enable us to have people form identities and then have something like — this is a, we can vibe code user interfaces, but you can just see the basic architecture of what was brought online. So obviously there's people that are people and have identities. And you could imagine in that database, you'd want to be able to search by purpose — like I'm looking for experts in coalition building. So that would bring up people with those skills.

**Max G:**
Just like you're kind of building.

**Jordan (~):**
So purpose, skills, you know, specific areas of knowledge. Like I'm looking for someone near me in North America with expertise in regenerative agriculture — bring up someone from the University of Idaho. Right?

Okay, so we want geospatial tagging, which is enabled here at least to some level — OpenStreetMap, Esri world imagery, Esri topographic, USGS hydrography, USGS land cover, EPA watersheds, NOAA weather radar. That's just for the United States, but whatever.

**Max G:**
So you can see the functionalities that they're playing with.

**Jordan (~):**
Then individuals need to be able to form circles, groups — whether companies or just temporary groups or whatever. Groups need to be holofractal. Groups of groups need to be able to form and federate. You'd want to be able to see what groups are around in your area. And groups can do things. You'd want groups to engage in projects or quests — specific, time-bound.

*(Graham joins the call)*

Graham's going to join us. Graham, good now, welcome.

**Max G:**
Hello, hello, hello.

---

## 5:50 – OpenImpact Overview for Graham

**Jordan (~):**
So I'm workshopping with Max right now, and with you now, how we're going to best leverage a couple of significant tools we have — one which is OASIS, and one which is this kind of holofractal data architecture that might underlie a platform called OpenImpact.

OpenImpact is the minimum viable working demonstration — tested with maybe 500 groups in 50 countries — of getting that whole data system working in which people can make profiles, have purpose, skills, knowledge, groups, be able to sort what groups are doing what around the world, each group having their own little profile page.

The 501c3 — the Lionsburg 501c3 in the United States — enables crowdfunding. So as groups initiate projects, you could imagine a crowdfunding button where people could make donations, and those objects turn into targets that as we start to pool money or gather resources, we can make governance engines and deploy those out to different projects. Max, you had something like status, grant requests submitted, whatever, right?

**Max G:**
Yep.

**Jordan (~):**
They created an entity called Organizations later on. At first it was just people, groups, projects. But some users wanted a more formal organization type. Resources are like knowledge artifacts — you could link this to something like an Obsidian Cloud, and you'd want to enable knowledge bases to be formed and shared from the bottom up — federated knowledge, sharing, whatever. You'd want a full security and permissioning system.

Do you have any questions about this?

---

## 8:46 – API Access & Forking the Codebase

**Max G:**
One question I have is — do we have access to this platform? Can we get the data from it?

**Jordan (~):**
Yes. So Jordan funded, with a little less than a million dollars, a couple-year sprint — this was before Claude Code — to bring something like this online as a minimum product. Because Jordan and Lionsburg were the sole funders of that opening sprint, we the people of Lionsburg have the right to fork this entire project and codebase if we can't agree on governance.

OpenImpact is an API-up platform. Before Jordan's event in August, and the subsequent closure of the Lionsburg bank accounts, there was a platform.lyonsburg.org that had a white-labeled version of this. So to answer directly — we can set up a white-labeled version of this, arrange access to the data, vibe code front-ends, and analyze the whole codebase. The group that built it may or may not want us to do that, so we may have to fork it and have Claude analyze it all and refactor it. But because it's API-up, I'm guessing OASIS would be just the kind of tool we'd need to figure that out and get something working again.

My intuition is that it might be the right thing to start with it while improving the functionalities and how it looks. But it could also be that Claude can one-shot something better. I don't really know that yet. So how do we figure that out?

**Max G:**
I mean, I'd say that because you stress-test the actual structures themselves, I'm sure they're valuable. The question again would be — do we want to invite any of those groups to be involved? Or is this more just a template you think is going to be useful?

**Jordan (~):**
We want to, yeah. That's a big group of people. Because of how we're doing governance, Jordan just funded it through donations and grants through the nonprofit. So most of those groups have never heard of us or Lionsburg, but they'll be happy somewhere down the road when they realize how this came into being. And of course, they'd be invited and excited that they're already on a version of the platform.

So what I think we do, since we're coming to the starting point and we're going to be issuing IDA and stuff — we create a white-labeled version of this. We figure out how to get a developer SDK on it that'll let us work with it at the speed that we can. We figure out how this API-up front end relates to whatever back-end data structures we're using.

I almost wonder — does something like OASIS almost bridge? Like, if there's some DAO-based governance platform, and then there's this platform, and then there's something else really cool someone's built that's more of a quest-and-points engine with a time currency thing in it — how do we get to the starting point with kind of the best available version of those different tools in a really easy-to-use web app that isn't limited by any of them but can draw on them in the background?

**Max G:**
Is that a right question to ask? Yeah, definitely.

**Jordan (~):**
If this platform has proved some mechanics and already broken some things so we're confident it might work, but we don't like how it looks — how do we put the shiny wrapper on it that draws on all this and works?

---

## 15:49 – Identity, Projects & Interoperability

**Max G:**
Yeah. A lot of it is going to focus around the identity part of the individuals and the identity of their projects, and I think it ties in very nicely to the conversation you and I had a couple of days ago about holonic businesses and holonic properties — you were talking about agreements, contracts, and domains. The opportunity we have is to build identities and projects that are holonic — that can live in multiple different front ends.

So we have one place, and whether you want to upload your project to a quadratic funding platform, or enter it into a hackathon, or enter it into a festival — the idea is we want to have a single persistent place for it.

Then on the templating side of things, I would suggest we just take a pass at it — ingest all the patterning. If you're able to bring the team on board, great. If you're able to bring the projects on board, great.

All the conversations I've had with Mitchell are pointing in the direction of — we can build a first-class identity system that this can use. There's a great way of tracking projects and commitments. I think we can expand and improve on that system with these additional components.

One thing I wanted to talk to you about is an opportunity to present everything we're doing in front of Gatherverse — an XR/VR festival dedicated to improving humanity. Our advisor Alina is currently due to be presenting on OASIS specifically, but seeing as my focus is somewhat switching now into how OASIS is supporting Hitchhikers, we may want to put together a package that's more geared around the Fabulous Machine and an invitation for other technologists to contribute to this vision.

---

## 20:31 – The Fabulous Machine & Speed of Development

**Jordan (~):**
Yeah, that's awesome. The Fabulous Machine concept is what's going to make it feel good to use all these proven back-end pieces that are going to work. And there's the big question of when changes are made — we're going to want to make those at the speed that we can, and it's going to be hard if there are single geniuses who have to flip certain switches.

**Max G:**
Like, what do you mean specifically there?

**Jordan (~):**
So like, this platform has been tested with project-based learning in Tier 1 universities. That's a whole functionality and workflow that someone spent many years on. And if we ask that team, it'll be like, okay, we're planning on having that online in a couple months. It's a few people going slowly at the speed they can. Maybe it requires Gary himself to personally do something that only he knows how to do in his own fabulous machine. So how do we remove those dependencies?

**Max G:**
That's the human challenge. Your tech can move super fast, but the humans involved may not be able to move quite as fast. So the question is — how do we build around that?

---

## 23:13 – The Value of Deep Human Work vs. AI Speed

**Jordan (~):**
Help me think through — in an area where we can vibe code anything, so to speak, a couple years ago, things would have taken five years and $50 million, or somebody just working tirelessly for 10 or 20 years to create. And there's levels of human thought and sophistication and things that are known that AI might miss.

So what is the value of something like this platform — where someone spends 10 years working on data architecture, testing it in all these things, then a few years building this API app and rolling it out to groups around the world? We know it can help facilitate interoperable community currencies, time banking, a lot of these things. But if we just have Claude one-shotting things, we're going to miss the deep human wisdom.

And the level of wisdom and rigor that 10 years of work on something takes means that the system mechanics are correct in a way you can't really know any other way.

**Max G:**
Yeah, and it's the same as what we've already said — you're not entitled to your opinions, right? So that represents a deep source of human knowledge and also credibility on the networking side. That's where its primary value exists — the human time that's already been put into it is probably the benefit.

The question really is whether they'd be willing to come on board and work with us, or whether that would be an issue. Are you grappling with the question of do we fork it, or do we reach out?

**Jordan (~):**
We would need their help to fork it, so I would definitely reach out. I prefer if they want to work with us. I would definitely prefer if there was a way to get the tech guild building together around all the platforms that we're stewarding and figuring out interoperability between them. I'm concerned that the willingness to collaborate isn't there, and then I'm evaluating — if that's the case, is it worth going through the effort to fork it and continue working with what's already done?

**Max G:**
So, what we can actually do in the meantime — the one big value-add would be improvements to the identity and credentialing and then the interoperability component. If we can create that system that just improves the functionality — for instance, with these projects, you've got to find funding from many different sources.

I'm seeing DAOs, Impact Hub DAOs and places where there is money available, but you have to be on their platform. So if you have a single platform and you're expecting it to be the be-all and end-all of funding, you're going to struggle.

**Jordan (~):**
Yeah, exactly.

**Max G:**
So we can already be thinking about the home for projects. They don't even have to leave their existing structure if they don't want to, but they can have it that exists in multiple places. So instead of us saying, "hey, we want to use all your work," it's more like, "hey, would you like to participate in this thing? You're going to get access to this wider thing that's going on."

---

## 30:27 – Governance Structure & Omni-Federation

**Jordan (~):**
Yeah, okay. And then yesterday, Graham Boyd and I came to a good agreement on governance and corporation — omni-federation type stuff — how we legally model a holofractal sovereign company and commons thing that works properly. We've got a draft agreement in place for that. And you and David were kind of wanting to consider evolving OASIS's stewardship structure into something that would federate with everything else — is that correct?

**Max G:**
So certainly, the conversation that I had with David Ellums and David Bovill about pooling the IP and having that held in some kind of structure — potentially with the Hitchhiker's wrapper around it — that was very attractive to me, and because it was attractive to me, I explained the benefits of it to David.

The thing to be mindful of is just making it very clear that this doesn't mean letting go of its ability to make money. The big watch out here is — David really wants to see his son. In order to get his son, he needs the right structure and money coming in. That's a long-winded way of saying yes, but it needs to feel solid, and it needs to feel like this is going to be a vehicle to actually bring some money in.

**Jordan (~):**
Great. Okay. So at least now you have that in your mind. I just wanted to go through that with you so you kind of know what's there — an API platform that has put a lot of thought into how these pieces work, socialized it with groups around the world, done some of the thing. There's a holofractal database type architecture on the back end.

---

## 34:00 – Max's Screen Share: Project Visibility via API

**Max G:**
Can I share my screen?

**Jordan (~):**
Yeah.

*(Screen sharing started — [WATCH](https://fathom.video/share/izC5KhWYQjL_AMisttgtHsEHFdjJS_RJ?timestamp=2061.770748))*

**Max G:**
So, seeing as it's an API, we could just give them the very simple option of — hey, put your data in and it will be visible on this sort of global view. We can see your projects that are ongoing here. And we make it so that other funders can come in and donate — either time or money. It's just an additional resource for them.

Seeing as you said it's an API, I don't know whether we have access to it, but if we did, it would be awesome to see how we might plug it in as a test case for how we plug in other existing databases. Imagine you have this, and then you can click the full details, and that would give you the top-level overview, then take you to the website with the platform. It wouldn't require them to give up their existing thing. It just basically gives it another home.

**Jordan (~):**
So I guess we just need some kind of relational vetting process where everybody can check out each other's work and, in the spirit of collaboration, see how everything fits without people trying to control things. Okay. Got it. That's helpful. Thank you, brother.

---

## 36:45 – Gatherverse Presentation

**Max G:**
So, yeah — and then, we met with... Were you on the call yesterday with Magpie?

**Jordan (~):**
No. I need to ask Graham, because he missed the meeting and was upset — he felt like he wasn't being appreciated for his work.

**Max G:**
Scottish Graham — Al Graham — there were two meetings going on at 10 a.m., 8 a.m. your time, so Magpie was sent to the wrong one.

And then, I guess, final question — do you have any thoughts on how we might want to do this Gatherverse presentation? I've promised to put a skeleton together with actual technology materials, with a kind of pro-humanity and XR perspective.

**Jordan (~):**
What's XR?

**Max G:**
Extended reality — that connection between real world and digital. *(Shares Alina's speaker profile)* Here's our speaker, by the way — Elina.

**Jordan (~):**
Okay, so she's speaking for us.

**Max G:**
Yes. She's presenting initially on OASIS, but I think it makes sense to say — hey, we're actually building the Fabulous Machine together.

**Jordan (~):**
Yeah, yeah. So there's a Fabulous Machine, New Earth Operating System type pitch. And if I was going to comment on the best, most likely thing to improve OASIS's future — it's federating OASIS and helping the community see what a valuable piece it is that enables the Fabulous Machine. The resources that flow to the whole who value the Fabulous Machine are going to make sure its key parts are all healthy and functioning. So I would be tempted to go towards the Fabulous Machine presentation.

The Fabulous Machine as far as XR also includes — if we wanted to, we could talk about the Holonic Omni-Federation stuff too. If I was going to do a presentation, it's like: okay, let's celebrate all these streams coming together. We have first-person project that had this breakthrough and this white paper, and Linux is client number one, and then we have these new ways to do privacy building on top of that, and then we have different platforms empowering individuals to form circles, choose quests, measure those quests — Pan Galactic, Time Bank, etc. We've got amazing technologies like OASIS that'll enable switchboarding and projects to show up in lots of places so nobody's excluded. And we've got ways to make this all work, drawing on the Lionsburg Fair Shares Commons type stuff — we now have ways to do this legally far beyond what we've done with DAOs or anything like that in the past. Come on board.

**Max G:**
Yeah. I would like to put a presentation together on that. The one thing that is important for these guys is visuals. Maybe it's a question of sharing some of the things that we've been vibe coding and the quests. Anyway, we'll figure that out. I think that makes a lot of sense. I'll see if I can spin it up over the weekend — and I'd love to introduce you to Alina, actually.

**Jordan (~):**
Yeah, excellent. And, you know, one of the biggest things we have for the first time is a pattern language coming up that enables us to do this in a legally sound way — where we all have a piece of the whole we're co-creating. It's movement beyond just individual projects into us all having a stake in all the different things we're co-creating and contributing to, each with its own proper governance, but having a stake in the whole.

---

## 43:33 – New Earth Operating System Pattern Language

**Max G:**
Absolutely.

**Jordan (~):**
Let me show you real quick what I was working on this morning.

*(Screen sharing started — [WATCH](https://fathom.video/share/izC5KhWYQjL_AMisttgtHsEHFdjJS_RJ?timestamp=2649.250465))*

This is less tech-focused, more governance-focused — coming out of the meeting with Graham. Claude jammed this: *"Co-creating the New Earth Operating System together."*

The discussion of collapse, ascension, nexus — old systems are failing, new systems are coming online. It's crucial that we co-create a new operating system that actually works. You have all these converging streams: lean manufacturing, Toyota production system, lean construction, theory of constraints, systems theory, cybernetics, governance, whole system thinking — Bucky Fuller, Worksite Earth, Mondragon, Fair Shares Commons. All of that coming together now into this golden seed or pattern language, immediately actionable by any group that enables co-creation and omni-federation.

The pattern language isn't complete — it's good enough to try, safe enough for now. It protects sovereignty at all levels and creates a way to form circles, companies, communities that are themselves whole — a way to grow, undertake meaningful quests, measure those quests, federate everything, measure time and energy. This isn't the final Earth operating system — it's the minimum viable seed that allows us to radically collaborate and co-create what comes next. The beginning of a living, self-evolving, self-governing body designed to continuously elevate and transform.

That's the governance side, but very tangibly in how it crosses into the real world and meets the challenges of governance. And if we set this up right in terms of governance and it's legally sound, everything we're vibe coding and co-creating — we all have a stake in not only our own projects, but in the greatest value of the whole that we can pull together.

**Max G:**
Hell yeah. Hell yeah, man. Good stuff.

---

## 46:39 – OpenSERV & Community Momentum

**Max G:**
So, on my to-do list — I'm putting together a little update for the OpenSERV guys that ties some of this stuff together. I guess one of the challenges on my end right now is there's so much weaving going on between all of the different people in our group, but then I also have the OASIS side of things, and the OpenSERV side, and a community that needs to be managed. I think I've somewhat failed at that task, and some of the momentum from the relationships has come out. My challenge is to see how I can reignite it.

**Jordan (~):**
With who in particular?

**Max G:**
With OpenSERV. Yeah — my advice would be, don't get slowed down by the weaving. We have something really exciting to take back to OpenSERV now — we probably know more about it and it's more exciting with more energy than we thought was there. We can say it better. They still haven't got back to you from early this week — did they?

**Max G:**
No.

**Jordan (~):**
Did you reach out to somebody there to chat?

**Max G:**
No, haven't yet, but I'm going to — I think I'm going to do it now, really, just to update.

**Jordan (~):**
Exactly. Yeah, just keep the relationship alive. Act positive — we've got a lot of exciting stuff happening. I see a path where we might be able to contribute even more than we were kind of talking about. Let's circle up early next week and see if we can nail down next steps.

---

## 49:47 – Next Steps with OpenSERV

**Jordan (~):**
So OpenSERV isn't really waiting for a proposal or anything from us right now, right? It's more communication falling in between?

**Max G:**
I think the output from the last workshop was they were going to have a think about what they want to do. But part of what's going on is there's not much to see. So much of Hitchhikers is occurring — it's a serious body of work that hasn't yet had a go-live moment where they can point and say, "wow, this thing is really about to—we don't want to miss out on this." So it's out of sight, out of mind a little bit. It just requires more communication.

**Jordan (~):**
Yeah, exactly. Let them know we've been in a week-long planning intensive, lots of exciting things and people coming together. Next week opens back up — we'd love to get together and see if we can pin down some next steps for collaboration.

What's coming up is people don't know how to do what they want to do. You could say to them also — I know you guys were rethinking, and during a full-time week-long sprint, our thinking has evolved a lot too in really positive ways. If it would be helpful, we can put together a fresh proposal with some of our ideas for review. You kind of want to put something in writing, and you could almost propose: hey, if we want to run this at a $250,000 level, here's what we can do. If we want to really put weight behind the entire Builders Fund, we can roll things together.

But yeah — just touch base lightly, let them know we've been making great progress, we're thinking of them often, and we'll circle up next week. It feels like there's a clear vision we could bring together and see if it aligns.

**Max G:**
Good. That sounds great. You have an amazing ability to speak things that would look very good in writing. You and David both have that. It's great to have.

---

## 52:47 – Closing: Committing to Structure

**Jordan (~):**
Yeah, and you have many amazing abilities that I don't as well. We're strong together, man.

Anytime I can help relieve little blockages for you — review something, move something — let me know. And by next week, our collaboration will have more structure. Because I'm going to ask — who's in and pledging 42 hours for this sprint as a minimum viable thing? Some of us are pledging full time. That's really going to force us to start to act like a company a little bit more — form teams, prioritize projects, gather resources, move things. That'll come alive in a very tangible way next week.

Let me say that differently: we can make that come alive next week if people consent to it and desire to be in that kind of environment. I desire to be in that kind of environment and treat this with the seriousness of a real project. If other people consent, let's start doing it next week. We'll all become officially parts of something we're responsible for, start measuring it. I think that'll change the field — less like a voluntary collaboration, more like we're really building something special together.

**Max G:**
Yeah. Yes. Okay. Wonderful. Great to talk. Much love.

**Jordan (~):**
Deeply enjoying getting to know you. You're a beautiful human, and thanks for all you're doing to push things forward. I'm just mind blown when you quickly spin up these things. It's super cool.

**Max G:**
Keep going, man. It's just going to get more awesome.

**Jordan (~):**
Yeah, it's just going to get more awesome. And don't forget that little convention — David, our creative director, might want to change it. But for now, you can spin up any of the elements.

**Max G:**
Yeah.

**Jordan (~):**
Okay. Thanks.
